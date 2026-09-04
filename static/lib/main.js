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
			if (document.getElementById('sso-google-primary-container')) {
				return;
			}

			const container = document.createElement('div');
			container.id = 'sso-google-primary-container';
			container.className = 'sso-google-container';
			container.innerHTML = `
				<a href="${config.relative_path}/auth/google" class="sso-google-btn-primary ${styleClass}">
					<span class="sso-google-icon">${GOOGLE_SVG}</span>
					<span class="sso-google-text">${label}</span>
				</a>
				<div class="sso-google-divider">
					<span>or</span>
				</div>
			`;

			// Prepend to the form
			formEl.insertBefore(container, formEl.firstChild);

			// Hide duplicated Google button in the alternative login block
			document.body.classList.add('sso-google-hide-alt');
			const altBlock = document.querySelector('.alt-login-block');
			if (altBlock) {
				const nonGoogleAlt = altBlock.querySelectorAll('.alt-logins li:not(.google)');
				if (nonGoogleAlt.length === 0) {
					altBlock.style.display = 'none';
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
