'use strict';

define('admin/plugins/sso-google-extended', ['settings', 'alerts'], function (Settings, alerts) {
	const ACP = {};

	function updateLivePreview() {
		const position = $('#buttonPosition').val() || 'top';
		const style = $('#buttonStyle').val() || 'google-brand';
		const label = $('#buttonLabel option:selected').text() || $('#buttonLabel').val() || 'Continue with Google';

		const previewBtn = $('#preview-google-btn');
		const previewDivider = $('#preview-divider');
		const previewLocalFields = $('#preview-local-fields');
		const previewContainer = $('#preview-layout-container');
		const previewBadge = $('#preview-status-pill');

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
				'box-shadow': '0 1px 3px rgba(0, 0, 0, 0.1)',
			});
		} else {
			previewBtn.removeClass('standard').addClass('google-brand');
			previewBtn.css({
				'background-color': '#ffffff',
				'color': '#3c4043',
				'border': '1px solid #dadce0',
				'box-shadow': '0 1px 2px 0 rgba(60, 64, 67, 0.12), 0 1px 3px 1px rgba(60, 64, 67, 0.08)',
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
		const id = ($('#app_id').val() || '').trim();
		const secret = ($('#secret').val() || '').trim();
		const badge = $('#sso-status-badge');
		if (!badge.length) return;

		const configuredText = badge.data('configured') || 'Active & Configured';
		const requiredText = badge.data('required') || 'Credentials Required';

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

	ACP.init = function () {
		Settings.load('sso-google-extended', $('.sso-google-settings'), function () {
			updateStatusBadge();
			updateLivePreview();
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

	// Delegated event bindings ensure responsiveness even on dynamic loads
	$(document).on('change input', '#buttonPosition, #buttonStyle, #buttonLabel, #hideAltLogins', updateLivePreview);
	$(document).on('input change', '#app_id, #secret', updateStatusBadge);

	// One-click copy for redirect URI
	$(document).on('click', '#copyCallbackBtn', function () {
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
	$(document).on('click', '#toggleSecretBtn', function () {
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

	// Always execute on initial DOM ready or cold load
	$(function () {
		updateStatusBadge();
		updateLivePreview();
	});

	return ACP;
});
