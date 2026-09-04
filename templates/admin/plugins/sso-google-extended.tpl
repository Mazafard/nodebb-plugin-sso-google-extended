<div class="acp-page-container">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="row m-0">
		<div id="spy-container" class="col-12 px-0 mb-4" tabindex="0">
			<!-- Header Hero Banner -->
			<div class="card shadow-sm border-0 rounded-4 p-4 mb-4 bg-body-tertiary">
				<div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between gap-3">
					<div class="d-flex align-items-center gap-3">
						<div class="p-3 bg-primary-subtle text-primary rounded-4 d-inline-flex align-items-center justify-content-center" style="width: 56px; height: 56px;">
							<i class="fa-brands fa-google fa-2x"></i>
						</div>
						<div>
							<h3 class="fw-bold mb-1 d-flex align-items-center gap-2">
								Google SSO Extended
								<span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill fs-7">v1.0.1</span>
							</h3>
							<p class="text-muted mb-0 small">Secure OAuth 2.0 authentication with primary CTA placement and authentic Google Identity styling.</p>
						</div>
					</div>
					<div>
						<span id="sso-status-badge" class="badge bg-secondary-subtle text-secondary border border-secondary-subtle px-3 py-2 rounded-pill fs-7">
							<i class="fa fa-circle me-1 small"></i> Checking status...
						</span>
					</div>
				</div>
			</div>

			<!-- Quick Setup & Callback URI Card -->
			<div class="card shadow-sm border-0 rounded-4 p-4 mb-4">
				<h5 class="fw-bold mb-2"><i class="fa fa-link text-primary me-2"></i> Authorized Redirect URI</h5>
				<p class="text-muted small mb-3">Copy this exact callback URL into your <strong>Google Cloud Console</strong> credentials page under <em>Authorised redirect URIs</em>.</p>
				
				<div class="input-group mb-3">
					<span class="input-group-text bg-body-secondary"><i class="fa fa-globe"></i></span>
					<input type="text" id="callbackUrlInput" class="form-control font-monospace" value="{baseUrl}/auth/google/callback" readonly>
					<button class="btn btn-outline-primary" type="button" id="copyCallbackBtn">
						<i class="fa fa-copy me-1"></i> Copy URL
					</button>
				</div>

				<div class="accordion" id="setupAccordion">
					<div class="accordion-item border rounded-3 overflow-hidden">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed bg-body-tertiary fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSetupGuide" aria-expanded="false" aria-controls="collapseSetupGuide">
								<i class="fa fa-info-circle me-2 text-info"></i> Step-by-Step Google Cloud Console Setup Guide
							</button>
						</h2>
						<div id="collapseSetupGuide" class="accordion-collapse collapse" data-bs-parent="#setupAccordion">
							<div class="accordion-body small text-muted">
								<ol class="mb-0 ps-3">
									<li class="mb-2">Visit the <a href="https://console.cloud.google.com/apis/credentials" target="_blank" rel="noopener noreferrer" class="fw-semibold">Google Cloud Credentials Console <i class="fa fa-external-link"></i></a> and create or select a project.</li>
									<li class="mb-2">Configure the <strong>OAuth consent screen</strong> with your forum app name and contact email.</li>
									<li class="mb-2">Navigate to <strong>Credentials</strong> &rarr; <strong>Create Credentials</strong> &rarr; <strong>OAuth Client ID</strong>.</li>
									<li class="mb-2">Select <strong>Web application</strong> as the Application type.</li>
									<li class="mb-2">Paste the URL above into <strong>Authorised redirect URIs</strong> and hit <kbd>Enter</kbd>.</li>
									<li>Copy your <strong>Client ID</strong> and <strong>Client Secret</strong> into the form below, save, and restart NodeBB.</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>

			<form role="form" class="sso-google-settings">
				<!-- Credentials & Security Card -->
				<div class="card shadow-sm border-0 rounded-4 p-4 mb-4">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<h5 class="fw-bold mb-0"><i class="fa fa-shield-halved text-success me-2"></i> API Credentials & Security</h5>
						<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill">Encrypted Storage</span>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold" for="app_id">OAuth Client ID</label>
						<input type="text" id="app_id" name="id" title="Client ID" class="form-control" placeholder="1234567890-xxx.apps.googleusercontent.com" autocomplete="off">
						<div class="form-text small">Obtained from the Google Cloud Console Credentials page.</div>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold" for="secret">OAuth Client Secret</label>
						<div class="input-group">
							<input type="password" id="secret" name="secret" title="Client Secret" class="form-control" placeholder="Enter your Google Client Secret" autocomplete="new-password">
							<button class="btn btn-outline-secondary" type="button" id="toggleSecretBtn" title="Show/Hide Secret">
								<i class="fa fa-eye" id="toggleSecretIcon"></i>
							</button>
						</div>
						<div class="form-text small">Your client secret is stored securely and never transmitted to client browsers.</div>
					</div>
				</div>

				<!-- Layout & UX Placement Card -->
				<div class="card shadow-sm border-0 rounded-4 p-4 mb-4">
					<h5 class="fw-bold mb-2"><i class="fa fa-sliders text-primary me-2"></i> Layout, UX & Button Placement</h5>
					<p class="text-muted small mb-4">Customize the appearance, prominence, and positioning of Google Sign-in across your forum.</p>

					<div class="row g-4 mb-4">
						<div class="col-lg-7">
							<div class="mb-3">
								<label class="form-label fw-semibold" for="buttonPosition">Button Placement</label>
								<select class="form-select" name="buttonPosition" id="buttonPosition">
									<option value="top">Top of Form (Primary CTA — Embedded above username & password with "OR" divider)</option>
									<option value="before">Before Local Section (First / Left Column)</option>
									<option value="after">After Local Section (Standard NodeBB side/bottom placement)</option>
								</select>
								<div class="form-text small">
									<strong>Top of Form</strong> turns Google Sign-in into the primary conversion pathway while keeping standard login available below.
								</div>
							</div>

							<div class="row g-3 mb-3">
								<div class="col-md-6">
									<label class="form-label fw-semibold" for="buttonStyle">Visual Style</label>
									<select class="form-select" name="buttonStyle" id="buttonStyle">
										<option value="google-brand">Official Google Identity (Authentic colors, icon & shadow)</option>
										<option value="standard">Standard Theme Style</option>
									</select>
								</div>
								<div class="col-md-6">
									<label class="form-label fw-semibold" for="buttonLabel">Button Text</label>
									<select class="form-select" name="buttonLabel" id="buttonLabel">
										<option value="Continue with Google">Continue with Google (Recommended)</option>
										<option value="Sign in with Google">Sign in with Google</option>
									</select>
								</div>
							</div>

							<div class="form-check form-switch mb-2">
								<input type="checkbox" class="form-check-input" id="hideAltLogins" name="hideAltLogins" checked>
								<label for="hideAltLogins" class="form-check-label fw-semibold">
									Clean up Desktop Layout: Hide orphaned "Alternative Logins" header when Google is primary
								</label>
								<div class="form-text small">Removes the redundant right-hand column on desktop, cleanly centering the login card.</div>
							</div>

							<div class="form-check form-switch mb-2">
								<input type="checkbox" class="form-check-input" id="applyRegister" name="applyRegister" checked>
								<label for="applyRegister" class="form-check-label fw-semibold">
									Apply primary Google CTA placement on Registration page (/register)
								</label>
							</div>
						</div>

						<!-- Interactive Live Preview -->
						<div class="col-lg-5">
							<div class="border rounded-4 p-4 bg-body-tertiary h-100 d-flex flex-column justify-content-center">
								<div class="text-center mb-3">
									<span class="badge bg-body-secondary text-secondary-emphasis rounded-pill px-3 py-1 small">
										<i class="fa fa-eye me-1"></i> Live Button Preview
									</span>
								</div>
								<div id="preview-layout-container" class="p-3 bg-body rounded-3 shadow-sm border d-flex flex-column gap-2">
									<div id="preview-google-btn" class="sso-google-btn-primary google-brand text-center justify-content-center d-flex align-items-center gap-2">
										<span class="sso-google-icon">
											<svg viewBox="0 0 48 48" width="20" height="20" xmlns="http://www.w3.org/2000/svg">
												<path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/>
												<path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/>
												<path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/>
												<path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/>
												<path fill="none" d="M0 0h48v48H0z"/>
											</svg>
										</span>
										<span id="preview-google-text" class="fw-semibold">Continue with Google</span>
									</div>
									<div id="preview-divider" class="sso-google-divider my-2">
										<span>or</span>
									</div>
									<div id="preview-local-fields" class="text-center text-muted small py-2 bg-body-secondary rounded border border-dashed">
										<i class="fa fa-lock me-1"></i> Username & Password Fields
									</div>
								</div>
								<div class="text-center mt-2">
									<span id="preview-status-pill" class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill small">
										Placement: Top of Form (Primary)
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Account & Verification Controls Card -->
				<div class="card shadow-sm border-0 rounded-4 p-4 mb-4">
					<h5 class="fw-bold mb-3"><i class="fa fa-user-check text-warning me-2"></i> Registration & Verification Policies</h5>
					<div class="form-check form-switch mb-3">
						<input type="checkbox" class="form-check-input" id="autoconfirm" name="autoconfirm">
						<label for="autoconfirm" class="form-check-label fw-semibold">
							Auto-confirm Google email addresses
						</label>
						<div class="form-text small">Skip forum email activation since Google has already verified the account owner's email address.</div>
					</div>
					<div class="form-check form-switch">
						<input type="checkbox" class="form-check-input" id="disableRegistration" name="disableRegistration">
						<label for="disableRegistration" class="form-check-label fw-semibold">
							Disable new user registrations via Google SSO
						</label>
						<div class="form-text small">Only permits existing registered forum members to link and authenticate with their Google account.</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
(function () {
	function initPreviewHandlers() {
		function updateLivePreview() {
			var position = $('#buttonPosition').val() || 'top';
			var style = $('#buttonStyle').val() || 'google-brand';
			var label = $('#buttonLabel').val() || 'Continue with Google';

			var previewBtn = $('#preview-google-btn');
			var previewDivider = $('#preview-divider');
			var previewLocalFields = $('#preview-local-fields');
			var previewContainer = $('#preview-layout-container');
			var previewBadge = $('#preview-status-pill');

			if (!previewBtn.length || !previewContainer.length) {
				return;
			}

			$('#preview-google-text').text(label);

			if (style === 'standard') {
				previewBtn.removeClass('google-brand').addClass('standard');
				previewBtn.css({
					'background-color': 'var(--bs-primary, #0d6efd)',
					'color': '#ffffff',
					'border': '1px solid var(--bs-primary, #0d6efd)',
					'box-shadow': '0 1px 3px rgba(0, 0, 0, 0.1)'
				});
			} else {
				previewBtn.removeClass('standard').addClass('google-brand');
				previewBtn.css({
					'background-color': '#ffffff',
					'color': '#3c4043',
					'border': '1px solid #dadce0',
					'box-shadow': '0 1px 2px 0 rgba(60, 64, 67, 0.12), 0 1px 3px 1px rgba(60, 64, 67, 0.08)'
				});
			}

			if (position === 'top') {
				previewDivider.show();
				previewContainer.empty().append(previewBtn, previewDivider, previewLocalFields);
				if (previewBadge.length) {
					previewBadge.text('Placement: Top of Form (Primary)');
				}
			} else if (position === 'before') {
				previewDivider.hide();
				previewContainer.empty().append(previewBtn, previewLocalFields);
				if (previewBadge.length) {
					previewBadge.text('Placement: Before Local Form');
				}
			} else {
				previewDivider.show();
				previewContainer.empty().append(previewLocalFields, previewDivider, previewBtn);
				if (previewBadge.length) {
					previewBadge.text('Placement: After Local Form');
				}
			}
		}

		function updateStatusBadge() {
			var id = ($('#app_id').val() || '').trim();
			var secret = ($('#secret').val() || '').trim();
			var badge = $('#sso-status-badge');

			if (id && secret) {
				badge.removeClass('bg-secondary-subtle text-secondary border-secondary-subtle bg-warning-subtle text-warning border-warning-subtle')
					.addClass('bg-success-subtle text-success border-success-subtle')
					.html('<i class="fa fa-check-circle me-1 small"></i> Active & Configured');
			} else {
				badge.removeClass('bg-secondary-subtle text-secondary border-secondary-subtle bg-success-subtle text-success border-success-subtle')
					.addClass('bg-warning-subtle text-warning border-warning-subtle')
					.html('<i class="fa fa-exclamation-triangle me-1 small"></i> Credentials Required');
			}
		}

		$(document).off('change input', '#buttonPosition, #buttonStyle, #buttonLabel, #hideAltLogins')
			.on('change input', '#buttonPosition, #buttonStyle, #buttonLabel, #hideAltLogins', updateLivePreview);

		$(document).off('input change', '#app_id, #secret')
			.on('input change', '#app_id, #secret', updateStatusBadge);

		updateLivePreview();
		updateStatusBadge();
	}

	if (window.$) {
		$(initPreviewHandlers);
	} else {
		document.addEventListener('DOMContentLoaded', initPreviewHandlers);
	}
})();
</script>
