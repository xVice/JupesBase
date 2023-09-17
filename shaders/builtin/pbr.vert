#version 330 core

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec2 inTexCoord;

out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoord;

uniform mat4 modelViewProjection;
uniform mat4 modelMatrix;

void main()
{
    FragPos = vec3(modelMatrix * vec4(inPosition, 1.0));
    Normal = mat3(transpose(inverse(modelMatrix))) * inNormal;
    TexCoord = inTexCoord;

    gl_Position = modelViewProjection * vec4(inPosition, 1.0);
}
