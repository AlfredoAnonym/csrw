texture shaderTexture;

technique replaceTexture
{
	pass P0
	{
		Texture[0] = shaderTexture;
	}
}