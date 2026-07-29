include ./scripts/exports.mk
include ./scripts/build_wrappers.mk
include ./scripts/system_dependencies.mk

$(eval $(call build_wrapper_meson,fontconfig))
$(eval $(call build_wrapper_cmake,cglm))
$(eval $(call build_wrapper_cmake,freetype))
$(eval $(call build_wrapper_meson,harfbuzz))
$(eval $(call build_wrapper_cmake,glfw))
$(eval $(call build_wrapper_cmake,unicode))
$(eval $(call build_wrapper_cmake,glad))
$(eval $(call build_wrapper_cmake,stb_cmake))
$(eval $(call build_wrapper_cmake,cgltf_cmake))
$(eval $(call build_wrapper_autotools,ffmpeg))

externals: \
	fontconfig \
	cglm \
	freetype \
	harfbuzz \
	glfw \
	unicode \
	glad \
	stb_cmake \
	cgltf_cmake \
	ffmpeg 

.PHONY: install
install: externals

clean:
	rm -rf build
	rm -rf install
	rm .clangd
