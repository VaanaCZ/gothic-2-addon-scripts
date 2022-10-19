///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Herold_Info   (C_INFO)
{
	npc         = VLK_406_Herold;
	nr          = 10;
	condition   = DIA_Herold_Info_Condition;
	information = DIA_Herold_Info_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Herold_Info_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Herold_Info_Info()
{
	AI_Output (self ,other,"DIA_Herold_Info_04_00"); //Nie przeszkadzaj mi. Jestem na s³u¿bie.
	
	AI_StopProcessInfos (self);
};


//Joly: Siehe B_Announce_Herold.d













