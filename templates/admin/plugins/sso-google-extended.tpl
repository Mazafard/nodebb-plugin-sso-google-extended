<div class="acp-page-container">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="row m-0">
		<div id="spy-container" class="col-12 px-0 mb-4" tabindex="0">
			<div class="alert alert-info">
				<strong>Quick Start</strong>
				<ol>
					<li>
						Create a <strong>New Project</strong> via the
						<a href="https://code.google.com/apis/console/">API Manager <i class="fa fa-external-link"></i></a>
					</li>
					<li>
						From the "Credentials" page, create a new "OAuth Client ID". (<a data-action="help-credentials" href="{config.relative_path}/plugins/nodebb-plugin-sso-google/images/credentials.png"><i class="fa fa-question-circle"></i> Where is this page?</a>)
						<ul>
							<li>The "Application Type" is "Web application"</li>
							<li>"Name" can be anything. Perhaps "NodeBB SSO" will suffice.</li>
							<li>"Authorized Javascript origins" can be left empty</li>
							<li>
								The "Authorised Redirect URI" is your NodeBB's URL with `/auth/google/callback` appended to it.
								<ul>
									<li>Our best guess for this site is <code>{baseUrl}/auth/google/callback</code></li>
									<li>When you enter this value into the text field, be sure to hit <code>Enter</code> to submit the URL before saving</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>You will be shown a screen containing your <strong>Client ID</strong> and <strong>Client Secret</strong>.</li>
					<li>You can set this values in two ways
						<ul>
							<li>Use environment variables
								<ul>
									<li><code>export SSO_GOOGLE_CLIENT_ID='Client ID'</code></li>
									<li><code>export SSO_GOOGLE_CLIENT_SECRET='Client Secret'</code></li>
								</ul>
							</li>
							<li>Use form below (this behavior overrides the environment variables)</li>
						</ul>
					</li>
					<li>Save and restart NodeBB via the ACP Dashboard</li>
				</ol>
			</div>
			<form role="form" class="sso-google-settings">
				<div class="card shadow-sm p-4 mb-4 border-0 rounded-3">
					<h5 class="fw-bold mb-3"><i class="fa fa-key text-primary me-2"></i> Google OAuth API Credentials</h5>
					<div class="mb-3">
						<label class="form-label fw-semibold" for="app_id">Client ID</label>
						<input type="text" id="app_id" name="id" title="Client ID" class="form-control" placeholder="e.g. 1234567890-xxx.apps.googleusercontent.com">
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold" for="secret">Client Secret</label>
						<input type="password" id="secret" name="secret" title="Client Secret" class="form-control" placeholder="Client Secret">
					</div>
				</div>

				<div class="card shadow-sm p-4 mb-4 border-0 rounded-3">
					<h5 class="fw-bold mb-3"><i class="fa fa-sliders text-success me-2"></i> Login Button Placement & Style (Extended Features)</h5>
					<p class="text-muted small">Configure how prominently the Google Sign-in button appears on your forum's login and register pages.</p>
					
					<div class="mb-3">
						<label class="form-label fw-semibold" for="buttonPosition">Button Placement</label>
						<select class="form-select" name="buttonPosition" id="buttonPosition">
							<option value="top">Top of Login Form (Primary / Recommended — Above email & password inputs with divider)</option>
							<option value="before">Before Local Login Section (First / Left Column)</option>
							<option value="after">After Local Login Section (Standard NodeBB side/bottom placement)</option>
						</select>
						<div class="form-text small">
							Selecting <strong>Top of Login Form</strong> embeds a high-converting primary Google button right above the username/password fields, complete with a clean divider.
						</div>
					</div>

					<div class="row g-3 mb-3">
						<div class="col-md-6">
							<label class="form-label fw-semibold" for="buttonStyle">Visual Style</label>
							<select class="form-select" name="buttonStyle" id="buttonStyle">
								<option value="google-brand">Official Google Branded (Full width, authentic colors & shadow)</option>
								<option value="standard">Standard Theme Button</option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label fw-semibold" for="buttonLabel">Button Text</label>
							<select class="form-select" name="buttonLabel" id="buttonLabel">
								<option value="Continue with Google">Continue with Google</option>
								<option value="Sign in with Google">Sign in with Google</option>
							</select>
						</div>
					</div>

					<div class="form-check form-switch mb-2">
						<input type="checkbox" class="form-check-input" id="applyRegister" name="applyRegister" checked>
						<label for="applyRegister" class="form-check-label fw-semibold">
							Also apply primary Google button placement on Registration page (/register)
						</label>
					</div>
				</div>

				<div class="card shadow-sm p-4 mb-4 border-0 rounded-3">
					<h5 class="fw-bold mb-3"><i class="fa fa-shield-alt text-warning me-2"></i> Registration & User Controls</h5>
					<div class="form-check form-switch mb-3">
						<input type="checkbox" class="form-check-input" id="autoconfirm" name="autoconfirm">
						<label for="autoconfirm" class="form-check-label fw-semibold">
							Skip email verification for users registering via Google SSO
						</label>
						<div class="form-text small">Users with verified Google emails can skip the forum's activation email.</div>
					</div>
					<div class="form-check form-switch">
						<input type="checkbox" class="form-check-input" id="disableRegistration" name="disableRegistration">
						<label for="disableRegistration" class="form-check-label fw-semibold">
							Disable new user registrations via Google SSO
						</label>
						<div class="form-text small">Only allow existing registered accounts to link their Google account.</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
