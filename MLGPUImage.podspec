#
# Be sure to run `pod lib lint MLGPUImage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MLGPUImage'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MLGPUImage.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://gitlab.com/maplelabs-libs/mlgpuimage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Phi Nguyen' => 'phinguyen@maplelabs.co' }
  s.source           = { :git => 'https://gitlab.com/maplelabs-libs/mlgpuimage.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.3'
  s.default_subspec = 'Code'
  s.frameworks = 'Metal', 'MetalPerformanceShaders'
  s.subspec 'Code' do |code|
    code.subspec 'GPUImage2+Reused'   do |gpuimage2|
      gpuimage2.source_files = 'MLGPUImage/Classes/Code/GPUImage2+Reused/**/*'
    end
    code.subspec 'GPUImage3+Reused'   do |gpuimage3|
      gpuimage3.source_files = 'MLGPUImage/Classes/Code/GPUImage3+Reused/**/*'
    end
    code.subspec 'MLFilmoraEffect'    do |filmora_effect|
      filmora_effect.subspec 'Effects' do |effects|
        effects.source_files = 'MLGPUImage/Classes/Code/MLFilmoraEffect/Effects/{MLFilmoraBasicOperation,MLShaderGenerator}.swift'
        effects.subspec 'Comon' do |comon|
          comon.source_files = 'MLGPUImage/Classes/Code/MLFilmoraEffect/Effects/Comon/**/*'
        end
        effects.subspec 'Packages' do |packages|
          packages.source_files     = 'MLGPUImage/Classes/Code/MLFilmoraEffect/Effects/Packages/**/*.{swift,metal}'
          packages.resource_bundles = {'MLGPUImage' => ['MLGPUImage/Classes/Code/MLFilmoraEffect/Effects/Packages/**/*.{conf,frag,png,bmp,fsh,xml}']}
        end
      end
      filmora_effect.subspec 'Helpers' do |helpers|
        helpers.source_files = 'MLGPUImage/Classes/Code/MLFilmoraEffect/Helpers/**/*.{swift,metal}'
      end
      filmora_effect.subspec 'Models' do |models|
        models.source_files = 'MLGPUImage/Classes/Code/MLFilmoraEffect/Models/**/*.{swift,metal}'
      end
    end
    code.subspec 'MLMergeImageTools'  do |merge_image_tools|
      merge_image_tools.source_files = 'MLGPUImage/Classes/Code/MLMergeImageTools/**/*'
    end
  end
end
