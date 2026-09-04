<div class="acp-page-container">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="row m-0">
		<div id="spy-container" class="col-12 px-0 mb-4" tabindex="0">
			<!-- Header Hero Banner -->
			<div class="card shadow-sm border-0 rounded-4 p-3 p-md-4 mb-4 bg-body-tertiary">
				<div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between gap-3">
					<div class="d-flex align-items-center gap-3">
						<div class="p-2.5 bg-primary-subtle text-primary rounded-4 d-inline-flex align-items-center justify-content-center flex-shrink-0" style="width: 50px; height: 50px;">
							<i class="fa-brands fa-google fa-xl"></i>
						</div>
						<div>
							<h4 class="fw-bold mb-1 d-flex align-items-center gap-2 text-body">
								{{tx("sso-google-extended:admin.header.title")}}
								<span class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill small">v{version}</span>
							</h4>
							<p class="text-muted mb-0 text-sm">{{tx("sso-google-extended:admin.header.description")}}</p>
						</div>
					</div>
					<div>
						<span id="sso-status-badge" class="badge bg-secondary-subtle text-secondary border border-secondary-subtle px-3 py-2 rounded-pill small"
							data-configured="{{tx("sso-google-extended:admin.status.configured")}}"
							data-required="{{tx("sso-google-extended:admin.status.required")}}">
							<i class="fa fa-circle me-1 small"></i> {{tx("sso-google-extended:admin.status.checking")}}
						</span>
					</div>
				</div>
			</div>

			<!-- Quick Setup & Callback URI Card -->
			<div class="card shadow-sm border-0 rounded-4 p-3 p-md-4 mb-4">
				<h6 class="fw-semibold mb-2 text-body"><i class="fa fa-link text-primary me-2"></i> {{tx("sso-google-extended:admin.redirect.title")}}</h6>
				<p class="text-muted text-xs mb-3">{{tx("sso-google-extended:admin.redirect.lead")}}</p>
				
				<div class="input-group mb-3">
					<span class="input-group-text bg-body-secondary"><i class="fa fa-globe"></i></span>
					<input type="text" id="callbackUrlInput" class="form-control font-monospace text-sm" value="{baseUrl}/auth/google/callback" readonly>
					<button class="btn btn-outline-primary text-sm" type="button" id="copyCallbackBtn" data-copied="{{tx("sso-google-extended:admin.redirect.copied")}}">
						<i class="fa fa-copy me-1"></i> {{tx("sso-google-extended:admin.redirect.copy")}}
					</button>
				</div>

				<div class="accordion" id="setupAccordion">
					<div class="accordion-item border rounded-3 overflow-hidden">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed bg-body-tertiary text-sm fw-semibold py-2.5" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSetupGuide" aria-expanded="false" aria-controls="collapseSetupGuide">
								<i class="fa fa-info-circle me-2 text-info"></i> {{tx("sso-google-extended:admin.guide.title")}}
							</button>
						</h2>
						<div id="collapseSetupGuide" class="accordion-collapse collapse" data-bs-parent="#setupAccordion">
							<div class="accordion-body text-xs text-muted py-3">
								<ol class="mb-0 ps-3">
									<li class="mb-2">{{tx("sso-google-extended:admin.guide.step1")}}</li>
									<li class="mb-2">{{tx("sso-google-extended:admin.guide.step2")}}</li>
									<li class="mb-2">{{tx("sso-google-extended:admin.guide.step3")}}</li>
									<li class="mb-2">{{tx("sso-google-extended:admin.guide.step4")}}</li>
									<li class="mb-2">{{tx("sso-google-extended:admin.guide.step5")}}</li>
									<li>{{tx("sso-google-extended:admin.guide.step6")}}</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>

			<form role="form" class="sso-google-settings">
				<!-- Credentials & Security Card -->
				<div class="card shadow-sm border-0 rounded-4 p-3 p-md-4 mb-4">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<h6 class="fw-semibold mb-0 text-body"><i class="fa fa-shield-halved text-success me-2"></i> {{tx("sso-google-extended:admin.credentials.title")}}</h6>
						<span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill text-xs">{{tx("sso-google-extended:admin.credentials.encrypted")}}</span>
					</div>
					<div class="mb-3">
						<label class="form-label small fw-semibold text-secondary-emphasis" for="app_id">{{tx("sso-google-extended:admin.credentials.client_id")}}</label>
						<input type="text" id="app_id" name="id" title="Client ID" class="form-control text-sm" placeholder="1234567890-xxx.apps.googleusercontent.com" autocomplete="off">
						<div class="form-text text-xs text-muted">{{tx("sso-google-extended:admin.credentials.client_id_help")}}</div>
					</div>
					<div class="mb-2">
						<label class="form-label small fw-semibold text-secondary-emphasis" for="secret">{{tx("sso-google-extended:admin.credentials.client_secret")}}</label>
						<div class="input-group">
							<input type="password" id="secret" name="secret" title="Client Secret" class="form-control text-sm" placeholder="••••••••••••••••••••••••" autocomplete="new-password">
							<button class="btn btn-outline-secondary text-sm" type="button" id="toggleSecretBtn" title="Show/Hide Secret">
								<i class="fa fa-eye" id="toggleSecretIcon"></i>
							</button>
						</div>
						<div class="form-text text-xs text-muted">{{tx("sso-google-extended:admin.credentials.client_secret_help")}}</div>
					</div>
				</div>

				<!-- Layout & UX Placement Card -->
				<div class="card shadow-sm border-0 rounded-4 p-3 p-md-4 mb-4">
					<h6 class="fw-semibold mb-1 text-body"><i class="fa fa-sliders text-primary me-2"></i> {{tx("sso-google-extended:admin.layout.title")}}</h6>
					<p class="text-muted text-xs mb-3">{{tx("sso-google-extended:admin.layout.lead")}}</p>

					<div class="row g-4 mb-2">
						<div class="col-lg-7">
							<div class="mb-3">
								<label class="form-label small fw-semibold text-secondary-emphasis" for="buttonPosition">{{tx("sso-google-extended:admin.layout.placement")}}</label>
								<select class="form-select text-sm" name="buttonPosition" id="buttonPosition">
									<option value="top">{{tx("sso-google-extended:admin.layout.placement_top")}}</option>
									<option value="before">{{tx("sso-google-extended:admin.layout.placement_before")}}</option>
									<option value="after">{{tx("sso-google-extended:admin.layout.placement_after")}}</option>
								</select>
								<div class="form-text text-xs text-muted">{{tx("sso-google-extended:admin.layout.placement_help")}}</div>
							</div>

							<div class="row g-3 mb-3">
								<div class="col-md-6">
									<label class="form-label small fw-semibold text-secondary-emphasis" for="buttonStyle">{{tx("sso-google-extended:admin.layout.style")}}</label>
									<select class="form-select text-sm" name="buttonStyle" id="buttonStyle">
										<option value="google-brand">{{tx("sso-google-extended:admin.layout.style_google")}}</option>
										<option value="standard">{{tx("sso-google-extended:admin.layout.style_standard")}}</option>
									</select>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-semibold text-secondary-emphasis" for="buttonLabel">{{tx("sso-google-extended:admin.layout.label")}}</label>
									<select class="form-select text-sm" name="buttonLabel" id="buttonLabel">
										<option value="Continue with Google">{{tx("sso-google-extended:admin.layout.label_continue")}}</option>
										<option value="Sign in with Google">{{tx("sso-google-extended:admin.layout.label_signin")}}</option>
									</select>
								</div>
							</div>

							<!-- Live Preview Tip Callout -->
							<div class="alert alert-info-subtle border border-info-subtle rounded-3 p-2.5 mb-3 text-xs d-flex align-items-start gap-2">
								<i class="fa fa-lightbulb text-info mt-0.5"></i>
								<div class="text-body-secondary">{{tx("sso-google-extended:admin.layout.preview_tip")}}</div>
							</div>

							<div class="form-check form-switch mb-2">
								<input type="checkbox" class="form-check-input" id="hideAltLogins" name="hideAltLogins" checked>
								<label for="hideAltLogins" class="form-check-label text-sm fw-semibold text-body">
									{{tx("sso-google-extended:admin.layout.hide_alt")}}
								</label>
								<div class="form-text text-xs text-muted">{{tx("sso-google-extended:admin.layout.hide_alt_help")}}</div>
							</div>

							<div class="form-check form-switch mb-1">
								<input type="checkbox" class="form-check-input" id="applyRegister" name="applyRegister" checked>
								<label for="applyRegister" class="form-check-label text-sm fw-semibold text-body">
									{{tx("sso-google-extended:admin.layout.apply_register")}}
								</label>
							</div>
						</div>

						<!-- Interactive Live Preview -->
						<div class="col-lg-5">
							<div class="border rounded-4 p-3 bg-body-tertiary h-100 d-flex flex-column justify-content-center">
								<div class="text-center mb-2">
									<span class="badge bg-body-secondary text-secondary-emphasis rounded-pill px-3 py-1 text-xs">
										<i class="fa fa-eye me-1"></i> {{tx("sso-google-extended:admin.preview.badge")}}
									</span>
								</div>
								<div id="preview-layout-container" class="p-3 bg-body rounded-3 shadow-sm border d-flex flex-column gap-2">
									<div id="preview-google-btn" class="sso-google-btn-primary google-brand text-center justify-content-center d-flex align-items-center gap-2" style="min-height: 40px; padding: 0.5rem 1rem;">
										<span class="sso-google-icon">
											<svg viewBox="0 0 48 48" width="18" height="18" xmlns="http://www.w3.org/2000/svg">
												<path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/>
												<path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/>
												<path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/>
												<path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/>
												<path fill="none" d="M0 0h48v48H0z"/>
											</svg>
										</span>
										<span id="preview-google-text" class="fw-semibold text-sm">{{tx("sso-google-extended:button.continue_with_google")}}</span>
									</div>
									<div id="preview-divider" class="sso-google-divider my-1 text-xs">
										<span>{{tx("sso-google-extended:divider.or")}}</span>
									</div>
									<div id="preview-local-fields" class="text-center text-muted text-xs py-2 bg-body-secondary rounded border border-dashed">
										<i class="fa fa-lock me-1"></i> {{tx("sso-google-extended:admin.preview.local_fields")}}
									</div>
								</div>
								<div class="text-center mt-2">
									<span id="preview-status-pill" class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill text-xs"
										data-placement-top="{{tx("sso-google-extended:admin.layout.placement_top")}}"
										data-placement-before="{{tx("sso-google-extended:admin.layout.placement_before")}}"
										data-placement-after="{{tx("sso-google-extended:admin.layout.placement_after")}}">
										{{tx("sso-google-extended:admin.layout.placement_top")}}
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Account & Verification Controls Card -->
				<div class="card shadow-sm border-0 rounded-4 p-3 p-md-4 mb-4">
					<h6 class="fw-semibold mb-3 text-body"><i class="fa fa-user-check text-warning me-2"></i> {{tx("sso-google-extended:admin.policies.title")}}</h6>
					<div class="form-check form-switch mb-3">
						<input type="checkbox" class="form-check-input" id="autoconfirm" name="autoconfirm">
						<label for="autoconfirm" class="form-check-label text-sm fw-semibold text-body">
							{{tx("sso-google-extended:admin.policies.autoconfirm")}}
						</label>
						<div class="form-text text-xs text-muted">{{tx("sso-google-extended:admin.policies.autoconfirm_help")}}</div>
					</div>
					<div class="form-check form-switch">
						<input type="checkbox" class="form-check-input" id="disableRegistration" name="disableRegistration">
						<label for="disableRegistration" class="form-check-label text-sm fw-semibold text-body">
							{{tx("sso-google-extended:admin.policies.disable_registration")}}
						</label>
						<div class="form-text text-xs text-muted">{{tx("sso-google-extended:admin.policies.disable_registration_help")}}</div>
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
			var label = $('#buttonLabel option:selected').text() || $('#buttonLabel').val() || 'Continue with Google';

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
					previewBadge.text(previewBadge.data('placement-top') || 'Top of Form (Primary)');
				}
			} else if (position === 'before') {
				previewDivider.hide();
				previewContainer.empty().append(previewBtn, previewLocalFields);
				if (previewBadge.length) {
					previewBadge.text(previewBadge.data('placement-before') || 'Before Local Form');
				}
			} else {
				previewDivider.show();
				previewContainer.empty().append(previewLocalFields, previewDivider, previewBtn);
				if (previewBadge.length) {
					previewBadge.text(previewBadge.data('placement-after') || 'After Local Form');
				}
			}
		}

		function updateStatusBadge() {
			var id = ($('#app_id').val() || '').trim();
			var secret = ($('#secret').val() || '').trim();
			var badge = $('#sso-status-badge');
			if (!badge.length) return;

			var configuredText = badge.data('configured') || 'Active & Configured';
			var requiredText = badge.data('required') || 'Credentials Required';

			if (id && secret) {
				badge.removeClass('bg-secondary-subtle text-secondary border-secondary-subtle bg-warning-subtle text-warning border-warning-subtle')
					.addClass('bg-success-subtle text-success border-success-subtle')
					.html('<i class="fa fa-check-circle me-1 small"></i> ' + configuredText);
			} else {
				badge.removeClass('bg-secondary-subtle text-secondary border-secondary-subtle bg-success-subtle text-success border-success-subtle')
					.addClass('bg-warning-subtle text-warning border-warning-subtle')
					.html('<i class="fa fa-exclamation-triangle me-1 small"></i> ' + requiredText);
			}
		}

		// Copy callback button handler
		$(document).off('click', '#copyCallbackBtn').on('click', '#copyCallbackBtn', function () {
			var input = document.getElementById('callbackUrlInput');
			if (!input) return;
			input.select();
			navigator.clipboard.writeText(input.value).then(function () {
				var btn = $('#copyCallbackBtn');
				var orig = btn.html();
				var copiedMsg = btn.data('copied') || 'Copied!';
				btn.html('<i class="fa fa-check text-success me-1"></i> ' + copiedMsg);
				setTimeout(function () { btn.html(orig); }, 2500);
			});
		});

		// Toggle secret visibility
		$(document).off('click', '#toggleSecretBtn').on('click', '#toggleSecretBtn', function () {
			var input = $('#secret');
			var icon = $('#toggleSecretIcon');
			if (input.attr('type') === 'password') {
				input.attr('type', 'text');
				icon.removeClass('fa-eye').addClass('fa-eye-slash');
			} else {
				input.attr('type', 'password');
				icon.removeClass('fa-eye-slash').addClass('fa-eye');
			}
		});

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
