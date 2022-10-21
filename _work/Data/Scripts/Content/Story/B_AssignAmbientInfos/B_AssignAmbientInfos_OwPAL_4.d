// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OWPAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OWPAL_4_EXIT_Condition;
	information	= DIA_OWPAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OWPAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OWPAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_OWPAL_4_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_OWPAL_4_STANDARD_Condition;
	information	= DIA_OWPAL_4_STANDARD_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_OWPAL_4_STANDARD_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OWPAL_4_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_OWPAL_4_STANDARD_04_00"); //Innos ist meine Ehre und meine Ehre ist mein Leben.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OWPAL_4_STANDARD_04_01"); //Wir werden hier so lange ausharren, wie Innos sein Licht über uns hält.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OWPAL_4_STANDARD_04_02"); //Mit Innos' Hilfe werden wir die bösen Kreaturen von hier fernhalten.
	};
	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//----------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OWPAL_4 (var c_NPC slf)
{
	DIA_OWPAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OWPAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};





