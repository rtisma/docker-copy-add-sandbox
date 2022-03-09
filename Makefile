WITH_ADD := with-add
WITH_COPY := with-copy
WITH_COPY_MULTISTAGE := with-copy-multistage

output.bin.tar.xz:
	@echo "Generating..."
	@dd if=/dev/random of=output.bin bs=1 count=1 seek=500000000
	@tar cvf output.bin.tar.xz output.bin
	@rm -rf output.bin

with-add: output.bin.tar.xz
	@docker build -f ./$(WITH_ADD).Dockerfile -t $(WITH_ADD):latest ./
	@docker images | grep "$(WITH_ADD).*latest"
	@dive $(WITH_ADD):latest

with-copy: output.bin.tar.xz
	@docker build -f ./$(WITH_COPY).Dockerfile -t $(WITH_COPY):latest ./
	@docker images | grep "$(WITH_COPY).*latest"
	@dive $(WITH_COPY):latest

with-copy-multistage: output.bin.tar.xz
	@docker build -f ./$(WITH_COPY_MULTISTAGE).Dockerfile -t $(WITH_COPY_MULTISTAGE):latest ./
	@docker images | grep "$(WITH_COPY_MULTISTAGE).*latest"
	@dive $(WITH_COPY_MULTISTAGE):latest

clean:
	-rm -rf ./output.bin.tar.xz
	-docker rmi $(WITH_ADD):latest 
	-docker rmi $(WITH_COPY):latest 
	-docker rmi $(WITH_COPY_MULTISTAGE):latest
