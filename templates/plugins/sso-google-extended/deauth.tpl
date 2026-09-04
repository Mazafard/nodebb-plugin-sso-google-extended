<div class="row justify-content-center my-4">
	<div class="col-12 col-sm-10 col-md-8 col-lg-6">
		<div class="card shadow-sm border-0 rounded-4 overflow-hidden">
			<div class="card-header bg-danger-subtle text-danger-emphasis py-3 border-0">
				<h5 class="mb-0 fw-bold d-flex align-items-center gap-2">
					<i class="fa fa-triangle-exclamation"></i>
					{{tx("user:sso.dissociate-confirm-title")}}
				</h5>
			</div>
			<div class="card-body p-4">
				<p class="text-body mb-4 fs-6">
					{{tx("user:sso.dissociate-confirm", service)}}
				</p>

				<div class="alert alert-warning small mb-4">
					<i class="fa fa-info-circle me-1"></i>
					Once unlinked, you will no longer be able to log in with your Google account unless you re-authenticate it from your profile settings.
				</div>

				<form method="post" class="d-flex align-items-center justify-content-end gap-2">
					<input type="hidden" name="_csrf" value="{config.csrf_token}" />
					<a href="{config.relative_path}/me/edit" class="btn btn-outline-secondary">
						Cancel
					</a>
					<button type="submit" class="btn btn-danger">
						<i class="fa fa-unlink me-1"></i> {{tx("user:sso.dissociate")}}
					</button>
				</form>
			</div>
		</div>
	</div>
</div>