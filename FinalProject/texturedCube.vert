#version 330
layout (location = 0) in vec3 position;
layout (location = 1) in vec2 texCoord;
layout (location = 2) in vec3 normal;


uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec4 FragPosLightSpace;//

out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoords;


void main()
{
	TexCoords = vec2(texCoord.x, 1.0 - texCoord.y);
	FragPos = vec3(model * vec4(position, 1.0));
    Normal = mat3(transpose(inverse(model))) * normal;  

	FragPosLightSpace = projection * view * vec4(FragPos, 1.0);

	gl_Position = projection * view * vec4(FragPos, 1.0);
}