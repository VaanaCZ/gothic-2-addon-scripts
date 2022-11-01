///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fellan_EXIT   (C_INFO)
{
	npc         = VLK_480_Fellan;
	nr          = 999;
	condition   = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fellan_PICKPOCKET (C_INFO)
{
	npc			= VLK_480_Fellan;
	nr			= 900;
	condition	= DIA_Fellan_PICKPOCKET_Condition;
	information	= DIA_Fellan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fellan_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Fellan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fellan_PICKPOCKET);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_BACK 		,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
	
func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Tough Guy News 
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_News		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  1;
	condition	 = 	DIA_Fellan_News_Condition;
	information	 = 	DIA_Fellan_News_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Fellan_News_Condition ()
{	
	if  Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_News_Info ()
{
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_00"); //De acuerdo, así que me pegaste. Menuda gesta heroica.
	
		 if (MIS_AttackFellan == LOG_RUNNING)
		 && (FellanGeschlagen == FALSE)
		 {
		 	AI_Output (other, self, "DIA_Fellan_News_15_01"); //¿Dejarás de aporrear ahora o tengo que volver a pegarte?
		 	AI_Output (self, other, "DIA_Fellan_News_06_02"); //No, no me pegues más. Pararé. Pero si se cae algo por aquí, ¡será culpa tuya!
		 	
		 	FellanGeschlagen = TRUE;
		 	Npc_ExchangeRoutine (self,"OHNEHAMMER");
		 	AI_StopProcessInfos (self);
		 	
		 };
	}; 
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (self, other, "DIA_Fellan_News_06_03");  //¿Cuál es el problema? ¿Quieres otro puñetazo en la cara?
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_04"); //¿Qué clase de tarado eres? Lucha, no luches, habla... ¿qué pretendes exactamente?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_HALLO		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  2;
	condition	 = 	DIA_Fellan_HALLO_Condition;
	information	 = 	DIA_Fellan_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Por qué estás martilleando?";
};
func int DIA_Fellan_HALLO_Condition ()
{	
	if (FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Fellan_HALLO_15_00"); //¿Por qué estás martilleando?
	AI_Output (self, other, "DIA_Fellan_HALLO_06_01"); //Llevo días desesperado, intentando arreglar las goteras de mi casa.
	AI_Output (self, other, "DIA_Fellan_HALLO_06_02"); //Las vigas están desmoronándose desde que tuvimos esas lluvias recientemente. Dentro de poco, ¡todo se derrumbará sobre mí!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_Stop		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr 			 =  3;
	condition	 = 	DIA_Fellan_Stop_Condition;
	information	 = 	DIA_Fellan_Stop_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Podrías dejar de martillear?";
};

func int DIA_Fellan_Stop_Condition ()
{
	if (MIS_AttackFellan == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fellan_Stop_Info ()
{
	AI_Output (other, self, "DIA_Fellan_Stop_15_00"); //¿Podrías dejar de martillear?
	AI_Output (self, other, "DIA_Fellan_Stop_06_01"); //No, tengo que terminar esto.
	
	Info_ClearChoices (DIA_Fellan_Stop);
	Info_AddChoice (DIA_Fellan_Stop,"Deja de martillear o te romperé todos los huesos del cuerpo.",DIA_Fellan_Stop_Bones);
	Info_AddChoice (DIA_Fellan_Stop,"Te daré 10 monedas de oro si dejas de martillear.",DIA_Fellan_Stop_Gold);
	Info_AddChoice (DIA_Fellan_Stop,"Pues deja de martillear, ¿vale?",DIA_Fellan_Stop_Just);
};
FUNC VOID DIA_Fellan_Stop_Bones()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Bones_15_00"); //Deja de martillear o te romperé todos los huesos del cuerpo.
	AI_Output (self, other, "DIA_Fellan_Stop_Bones_06_01"); //Olvídalo o te meteré un poco de juicio en la cabeza con mi martillo.
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Fellan_Stop_Gold()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Gold_15_00"); //Te daré 10 monedas de oro si dejas de martillear.
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_01"); //Vaya... Es muy generoso por tu parte. Pero en cuanto a tu dinero, puedes...
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_02"); //… bueno, sabes lo que puedes hacer con él.
};
FUNC VOID DIA_Fellan_Stop_Just()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Just_15_00"); //Pues deja de martillear, ¿vale?
	AI_Output (self, other, "DIA_Fellan_Stop_Just_06_01"); //Intenta no molestarme demasiado, ¿vale?
};
///////////////////////////////////////////////////////////////////////
//	Info Alles klar?
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_klar		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  5;
	condition	 = 	DIA_Fellan_klar_Condition;
	information	 = 	DIA_Fellan_klar_Info;
	permanent	 =  TRUE;
	description	 = 	"Holaaaa, ¿te encuentras bien?";
};
func int DIA_Fellan_klar_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Fellan_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fellan_klar_Info ()
{
	AI_Output (other, self, "DIA_Fellan_klar_15_00"); //Holaaaa, ¿te encuentras bien?
	
	if (FellanGeschlagen == FALSE) 
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_01"); //Sí, mientras consiga reparar todo esto a tiempo.
	}
	else
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_02"); //El tejado está cada vez peor. La próxima vez que llueva, el agua me llegará a los tobillos. ¡Y es todo por tu culpa!
	};
	AI_StopProcessInfos (self);
};
//Kapitel 2 Miliz Kandidat 





