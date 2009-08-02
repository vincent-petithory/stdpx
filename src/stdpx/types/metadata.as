/**
 * @private
 */
private static var _shaderMetadata:ShaderMetadata;

/**
 * @inheritDoc
 */
public function get metadata():ShaderMetadata
{
	if (!_shaderMetadata)
	{
		// 'ShaderByteCode' references the class embedding 
		// the shader byte code in the class including this script.
		_shaderMetadata = new ShaderMetadata(new ShaderByteCode());
	}
	return _shaderMetadata;
}