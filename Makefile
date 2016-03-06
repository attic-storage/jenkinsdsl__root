startMaster:
	cd master-docker; $(MAKE) start

buildMaster:
	cd master-docker; $(MAKE) build

debug:
	cd jobs-and-seed; $(MAKE) debug

seed:
	cd jobs-and-seed; ./gradlew rest -DbaseUrl='http://$(shell docker-machine ip default):8080/' \
	        -Dpattern='jobs/seed.groovy' -Dusername=admin -Dpassword=adminjenkins

publishJobs:
	cd jobs-and-seed; ./gradlew rest -DbaseUrl='http://$(shell docker-machine ip default):8080/' \
	        -Dpattern='jobs/jobs_*.groovy' -Dusername=admin -Dpassword=adminjenkins

setupWorkflowLibs:
	cd workflowLibs; git push ssh://admin@$(shell docker-machine ip default):16042/workflowLibs.git master --force


