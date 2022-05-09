// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:31806,y:31437,varname:node_4795,prsc:2|emission-6933-OUT,clip-798-OUT;n:type:ShaderForge.SFN_Multiply,id:798,x:31591,y:31760,varname:node_798,prsc:2|A-654-OUT,B-236-A;n:type:ShaderForge.SFN_Tex2d,id:236,x:31358,y:31559,ptovrint:False,ptlb:SkillMask,ptin:_SkillMask,varname:_SkillMask,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:4457,x:31160,y:31350,ptovrint:False,ptlb:TintColor,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:6933,x:31612,y:31469,varname:node_6933,prsc:2|A-7252-RGB,B-4457-RGB;n:type:ShaderForge.SFN_Vector1,id:1662,x:30774,y:33378,varname:node_1662,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:1708,x:30835,y:31799,varname:node_1708,prsc:2,uv:0,uaff:True;n:type:ShaderForge.SFN_Subtract,id:654,x:31354,y:31779,varname:node_654,prsc:2|A-8187-OUT,B-7980-OUT;n:type:ShaderForge.SFN_Length,id:7980,x:31170,y:31799,varname:node_7980,prsc:2|IN-8035-OUT;n:type:ShaderForge.SFN_RemapRange,id:8035,x:31008,y:31799,varname:node_8035,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-1708-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:9540,x:30856,y:31610,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:_Scale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:8187,x:31104,y:31610,varname:node_8187,prsc:2|A-9540-OUT,B-1708-Z;n:type:ShaderForge.SFN_Tex2d,id:7252,x:31340,y:31187,ptovrint:False,ptlb:SkillTex,ptin:_SkillTex,varname:_SkillTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:236-4457-9540-7252;pass:END;sub:END;*/

Shader "AreaSkillShow" {
    Properties {
        _SkillMask ("SkillMask", 2D) = "white" {}
        _TintColor ("TintColor", Color) = (1,0,0,1)
        _Scale ("Scale", Float ) = 2
        _SkillTex ("SkillTex", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _SkillMask; uniform float4 _SkillMask_ST;
            uniform sampler2D _SkillTex; uniform float4 _SkillTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _TintColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Scale)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float4 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float _Scale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Scale );
                float4 _SkillMask_var = tex2D(_SkillMask,TRANSFORM_TEX(i.uv0, _SkillMask));
                clip((((_Scale_var*i.uv0.b)-length((i.uv0*2.0+-1.0)))*_SkillMask_var.a) - 0.5);
////// Lighting:
////// Emissive:
                float4 _SkillTex_var = tex2D(_SkillTex,TRANSFORM_TEX(i.uv0, _SkillTex));
                float4 _TintColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TintColor );
                float3 emissive = (_SkillTex_var.rgb*_TintColor_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
