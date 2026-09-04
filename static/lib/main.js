'use strict';

(function () {
	const GOOGLE_SVG = '<svg viewBox="0 0 48 48" width="20" height="20" xmlns="http://www.w3.org/2000/svg"><path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/><path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/><path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/><path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/><path fill="none" d="M0 0h48v48H0z"/></svg>';

	function handleGoogleSSOPlacement() {
		const ssoSettings = config['sso-google-extended'];
		if (!ssoSettings || !ssoSettings.enabled) {
			return;
		}

		const isLogin = ajaxify.data.template && ajaxify.data.template.login;
		const isRegister = ajaxify.data.template && ajaxify.data.template.register;

		if (!isLogin && (!isRegister || !ssoSettings.applyRegister)) {
			return;
		}

		const formEl = document.querySelector(isLogin ? '.login-block form, #login-form' : '.register-block form, #register-form');
		if (!formEl) {
			return;
		}

		const position = ssoSettings.buttonPosition || 'top';
		const styleClass = ssoSettings.buttonStyle === 'standard' ? 'standard' : 'google-brand';
		let label = ssoSettings.buttonLabel || 'Continue with Google';
		if (isRegister && label === 'Continue with Google') {
			label = 'Sign up with Google';
		}

		if (position === 'top') {
			if (!document.getElementById('sso-google-primary-container')) {
				const container = document.createElement('div');
				container.id = 'sso-google-primary-container';
				container.className = 'sso-google-container';

				const btn = document.createElement('a');
				btn.href = `${config.relative_path}/auth/google`;
				btn.className = `sso-google-btn-primary ${styleClass}`;
				btn.setAttribute('role', 'button');

				const iconSpan = document.createElement('span');
				iconSpan.className = 'sso-google-icon';
				iconSpan.innerHTML = GOOGLE_SVG;

				const textSpan = document.createElement('span');
				textSpan.className = 'sso-google-text';
				textSpan.textContent = label; // Safe textContent to prevent XSS

				btn.appendChild(iconSpan);
				btn.appendChild(textSpan);

				const divider = document.createElement('div');
				divider.className = 'sso-google-divider';
				const orSpan = document.createElement('span');
				orSpan.textContent = 'or';
				divider.appendChild(orSpan);

				container.appendChild(btn);
				container.appendChild(divider);

				formEl.insertBefore(container, formEl.firstChild);
			}

			// Clean up alternative logins block on desktop and mobile
			document.body.classList.add('sso-google-hide-alt');
			const altBlock = document.querySelector('.alt-login-block, .alt-register-block');
			if (altBlock) {
				const nonGoogleAlt = altBlock.querySelectorAll('.alt-logins li:not(.google)');
				const shouldHideEntireColumn = nonGoogleAlt.length === 0 || ssoSettings.hideAltLogins;

				if (shouldHideEntireColumn) {
					// Hide the parent grid column wrapper completely to eliminate the "Alternative Logins" header
					const altCol = altBlock.closest('[class*="col-"]');
					if (altCol) {
						altCol.style.setProperty('display', 'none', 'important');
					} else {
						altBlock.style.setProperty('display', 'none', 'important');
					}

					// Center and optimize the login column width on desktop
					const formCol = formEl.closest('[class*="col-"]');
					if (formCol) {
						formCol.classList.add('sso-google-centered-col');
					}
				} else {
					// If other SSO providers exist, just hide the Google entry from the list
					const googleLi = altBlock.querySelector('.alt-logins li.google');
					if (googleLi) {
						googleLi.style.setProperty('display', 'none', 'important');
					}
				}
			}
		} else if (position === 'before') {
			const row = formEl.closest('.row');
			if (row) {
				row.classList.add('sso-google-reorder-before');
			}
		}
	}

	$(window).on('action:ajaxify.end', handleGoogleSSOPlacement);

	if (document.readyState === 'complete' || document.readyState === 'interactive') {
		handleGoogleSSOPlacement();
	}
})();
