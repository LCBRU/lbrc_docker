# Building
build_python: .python.built

.python.built:
	docker build -t lcbruit/linuxbase:latest ./linuxbase
	docker build -t lcbruit/pythonbase:latest ./pythonbase
	docker build -t lcbruit/pythonwebappbase:latest ./pythonwebappbase
	touch $@

build_identity: .identity.built

.identity.built: .python.built 
	docker build --no-cache -t lcbruit/identity_web:latest ./identity/web
	docker build --no-cache -t lcbruit/identity_celery:latest ./identity/celery
	touch $@

build_image_study_merge: .image_study_merge.built

.image_study_merge.built: .python.built 
	docker build --no-cache -t lcbruit/image_study_merge_web:latest ./image_study_merge/web
	docker build --no-cache -t lcbruit/image_study_merge_celery:latest ./image_study_merge/celery
	touch $@

build_genvasc_portal: .genvasc_portal.built

.genvasc_portal.built: .python.built 
	docker build --no-cache -t lcbruit/genvasc_portal_web:latest ./genvasc_portal
	touch $@

build_redcap: .redcap.built

.redcap.built:
	docker build -t lcbruit/redcapbase:latest ./redcapbase

	docker build --build-arg redcap_directory=redcap_dev --build-arg image_type=dev -t lcbruit/redcap_dev:latest ./redcap_specific
	docker build --build-arg redcap_directory=genvasc_redcap --build-arg image_type=genvasc -t lcbruit/redcap_genvasc:latest ./redcap_specific
	docker build --build-arg redcap_directory=redcap --build-arg image_type=uhl -t lcbruit/redcap_uhl:latest ./redcap_specific
	docker build --build-arg redcap_directory=redcap --build-arg image_type=n3 -t lcbruit/redcap_n3:latest ./redcap_specific
	docker build --build-arg redcap_directory=redcap --build-arg image_type=national -t lcbruit/redcap_national:latest ./redcap_specific
	docker build --build-arg redcap_directory=redcap_test --build-arg image_type=test -t lcbruit/redcap_test:latest ./redcap_specific
	touch $@

build_clean:
	rm -f .*.built

build_all: .python.built .identity.built .image_study_merge.built .genvasc_portal.built .redcap.built

# Pushing
push_python: .python.pushed

.python.pushed:
	docker push lcbruit/linuxbase:latest
	docker push lcbruit/pythonbase:latest
	docker push lcbruit/pythonwebappbase:latest
	touch $@

push_identity: .identity.pushed

.identity.pushed: .python.pushed
	docker push lcbruit/identity_web:latest
	docker push lcbruit/identity_celery:latest
	touch $@

push_image_study_merge: .image_study_merge.pushed

.image_study_merge.pushed: .python.pushed
	docker push lcbruit/image_study_merge_web:latest
	docker push lcbruit/image_study_merge_celery:latest
	touch $@

push_genvasc_portal: .genvasc_portal.pushed

.genvasc_portal.pushed: .python.pushed
	docker push lcbruit/genvasc_portal_web:latest
	touch $@

push_redcap: .redcap.pushed

.redcap.pushed:
	docker push lcbruit/redcapbase:latest

	docker push lcbruit/redcap_dev:latest
	docker push lcbruit/redcap_genvasc:latest
	docker push lcbruit/redcap_uhl:latest
	docker push lcbruit/redcap_n3:latest
	docker push lcbruit/redcap_national:latest
	docker push lcbruit/redcap_test:latest
	touch $@

push_clean:
	rm -f .*.pushed

push_all: .python.pushed .identity.pushed .image_study_merge.pushed .genvasc_portal.pushed .redcap.pushed
