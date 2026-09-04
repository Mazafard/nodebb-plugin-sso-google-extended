'use strict';

define('admin/plugins/sso-google-extended', ['settings', 'alerts'], function (Settings, alerts) {
	const ACP = {};

	ACP.init = function () {
		function updateLivePreview() {
			const style = $('#buttonStyle').val() || 'google-brand';
			const label = $('#buttonLabel').val() || 'Continue with Google';

			const previewBtn = $('#preview-google-btn');
			previewBtn.removeClass('google-brand standard').addClass(style);
			$('#preview-google-text').text(label);
		}

		function updateStatusBadge() {
			const id = $('#app_id').val().trim();
			const secret = $('#secret').val().trim();
			const badge = $('#sso-status-badge');

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

		Settings.load('sso-google-extended', $('.sso-google-settings'), function () {
			updateStatusBadge();
			updateLivePreview();
		});

		$('#app_id, #secret').on('input change', updateStatusBadge);
		$('#buttonStyle, #buttonLabel').on('change input', updateLivePreview);

		// One-click copy for redirect URI
		$('#copyCallbackBtn').on('click', function () {
			const input = document.getElementById('callbackUrlInput');
			if (!input) {
				return;
			}
			navigator.clipboard.writeText(input.value).then(function () {
				alerts.alert({
					type: 'info',
					alert_id: 'sso-google-copied',
					title: 'Copied to Clipboard',
					message: 'Authorized Redirect URI copied successfully.',
					timeout: 3000,
				});
			}).catch(function () {
				input.select();
				document.execCommand('copy');
				alerts.alert({
					type: 'info',
					alert_id: 'sso-google-copied',
					title: 'Copied',
					message: 'Authorized Redirect URI copied to clipboard.',
					timeout: 3000,
				});
			});
		});

		// Toggle secret visibility
		$('#toggleSecretBtn').on('click', function () {
			const secretInput = $('#secret');
			const icon = $('#toggleSecretIcon');
			if (secretInput.attr('type') === 'password') {
				secretInput.attr('type', 'text');
				icon.removeClass('fa-eye').addClass('fa-eye-slash');
			} else {
				secretInput.attr('type', 'password');
				icon.removeClass('fa-eye-slash').addClass('fa-eye');
			}
		});

		$('#save').on('click', function () {
			Settings.save('sso-google-extended', $('.sso-google-settings'), function () {
				alerts.alert({
					type: 'success',
					alert_id: 'sso-google-extended-saved',
					title: 'Settings Saved',
					message: 'Please rebuild and restart your NodeBB to apply these settings, or click on this alert to reload.',
					clickfn: function () {
						socket.emit('admin.reload');
					},
				});
				updateStatusBadge();
			});
		});
	};

	return ACP;
});
