///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_298_EXIT   (C_INFO)
{
	npc         = PAL_298_Ritter;
	nr          = 999;
	condition   = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_Pass_Condition;
	information	 = 	DIA_PAL_298_Pass_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿A dónde lleva este camino?";
};
func int DIA_PAL_298_Pass_Condition ()
{	
	if (Kapitel == 1) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_Pass_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//¿Adónde lleva este camino?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Detrás de la puerta está el paso que lleva al Valle de las Minas.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//Estamos en este lado. Al otro se han emboscado unos cuantos orcos.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//Será mejor que vuelvas, no puedes pasar por aquí.
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_TRESPASS_Condition;
	information	 = 	DIA_PAL_298_TRESPASS_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_PAL_298_TRESPASS_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_TRESPASS_Info ()
{
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//¿Estás seguro de que quieres entrar aquí? Me temo que no llegarás muy lejos. Al otro lado están los orcos.
	AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//Si hay una forma de entrar en el Valle de las Minas, la encontraré.
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//Bien, entonces ve. Que Innos te acompañe.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm1_Condition;
	information	 = 	DIA_PAL_298_Perm1_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Y si voy por mi cuenta y riesgo?";
};
func int DIA_PAL_298_Perm1_Condition ()
{	
	if (Kapitel == 1)
	&& Npc_KnowsInfo (other, DIA_PAL_298_Pass)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm1_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//¿Y si voy por mi cuenta y riesgo?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Entonces morirás. Por eso estamos aquí, para que no tengas ideas descabelladas.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm2_Condition;
	information	 = 	DIA_PAL_298_Perm2_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Cómo van las cosas?";
};
func int DIA_PAL_298_Perm2_Condition ()
{	
	if  (Kapitel >= 2)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm2_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//¿Cuál es la situación?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//Todo está tranquilo. Tenemos la situación bajo control.
};


