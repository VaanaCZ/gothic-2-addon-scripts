// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Matt_EXIT(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 999;
	condition	= DIA_Addon_Matt_EXIT_Condition;
	information	= DIA_Addon_Matt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Matt_PICKPOCKET (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 900;
	condition	= DIA_Addon_Matt_PICKPOCKET_Condition;
	information	= DIA_Addon_Matt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Matt_PICKPOCKET_Condition()
{
	C_Beklauen (55, 91);
};
 
FUNC VOID DIA_Addon_Matt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
	
func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
// ************************************************************
// 			  Hello 
// ************************************************************
INSTANCE DIA_Addon_Matt_Hello(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 1;
	condition	= DIA_Addon_Matt_Hello_Condition;
	information	= DIA_Addon_Matt_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Matt_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Matt_Hello_10_01"); //Eres nuevo, �verdad? Genial. Nos viene bien m�s gente.
};

// ************************************************************
// 			 				PERM 
// ************************************************************
INSTANCE DIA_Addon_Matt_PERM (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 2;
	condition	= DIA_Addon_Matt_PERM_Condition;
	information	= DIA_Addon_Matt_PERM_Info;
	permanent	= TRUE;
	Description  = "�Qu� pasa?";
};                       
FUNC INT DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Matt_Alright_15_01"); //�C�mo va todo?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_02"); //�Qu� es lo que no entiendes de POCI�N CURATIVA?
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_01"); //Todo en orden. (c�nico) �Mi Capit�n!
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_01"); //Qu� gracioso. Ya no tenemos barco.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_02"); //Pienso esperar a ver qu� hace ahora Greg.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_03"); //Ahora mismo, el campamento est� en paz. Voy a relajarme un poco.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_04"); //Y yo en tu lugar, har�a lo mismo.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_05"); //Lo bandidos est�n aqu�, as� que la situaci�n podr�a cambiar antes de lo que querr�amos.
	};
};

// ************************************************************
// 			 				Banditen
// ************************************************************
INSTANCE DIA_Addon_Matt_Bandits(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 3;
	condition	= DIA_Addon_Matt_Bandits_Condition;
	information	= DIA_Addon_Matt_Bandits_Info;

	description = "�Qu� sabes de los bandidos?";
};                       
FUNC INT DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_Bandits_Info()
{	
	AI_Output (other, self,"DIA_Addon_Matt_Bandits_15_03"); //�Qu� sabes acerca de los bandidos?
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_01"); //�Dices aparte del hecho de que son una amenaza mortal y muchos m�s que nosotros?
	AI_Output (other,self ,"DIA_Addon_Matt_Bandits_15_02"); //S�.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_02"); //Est�n forrados.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_03"); //Bueno, al menos ESTABAN forrados. No pagaron el �ltimo env�o.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_04"); //Pero dudo que sea porque se hayan quedado sin oro.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_05"); //Lo que pasa es que se han vuelto muy arrogantes.
};

// ************************************************************
// 			 				Francis 
// ************************************************************
INSTANCE DIA_Addon_Matt_Francis(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 4;
	condition	= DIA_Addon_Matt_Francis_Condition;
	information	= DIA_Addon_Matt_Francis_Info;

	description = "�Qu� sabes sobre Francis?";
};                       
FUNC INT DIA_Addon_Matt_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_Matt_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_00"); //�Qu� sabes sobre Francis?
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_01"); //�Dices aparte de que es vago e incompetente?
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_02"); //S�.
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_03"); //A ver que piense. Hmm� no. No se me ocurre nada m�s.
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Matt_Anheuern(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 11;
	condition	= DIA_Addon_Matt_Anheuern_Condition;
	information	= DIA_Addon_Matt_Anheuern_Info;
	permanent	= FALSE;
	description = "Ven conmigo.";
};                       
FUNC INT DIA_Addon_Matt_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Matt_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_00"); //Ven conmigo.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_01"); //No puedo irme ahora, intento relajarme.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_02"); //�rdenes de Greg.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_03"); //(deprisa) Ah, comprendo. Eso lo cambia todo, claro. Vaya, que s� que te acompa�o.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_04"); //�A d�nde vamos?
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Cierra el pico y s�gueme.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Tenemos que despejar el ca��n.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};
func VOID DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ShutUp_15_00"); //Cierra el pico y s�gueme.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01"); //(maleducado) S�, s�. (sarc�stico) �Capit�n!
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};
func VOID DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00"); //Tenemos que despejar el ca��n.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01"); //No est�s en tus cabales. Est� infestado de bestias. Y esas cuchillas son peligrosas.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02"); //Lo s�. �Vienes o no?
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03"); //(suspira) M�s vale que lleves unas pociones curativas, porque vamos a necesitarlas.

	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Matt_ComeOn(C_INFO)
{
	npc			= 	PIR_1365_Addon_Matt;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Matt_ComeOn_Condition;
	information	= 	DIA_Addon_Matt_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Ven conmigo.";
};
func int DIA_Addon_Matt_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Matt_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Matt_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Matt_ComeOn_15_00"); //Ven conmigo.
	
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_ComeOn_10_01"); //S�, s�. (c�nico) �Capit�n!
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_GoHome(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 13;
	condition	= DIA_Addon_Matt_GoHome_Condition;
	information	= DIA_Addon_Matt_GoHome_Info;
	permanent	= TRUE;
	description = "Ya no te necesito.";
};                       
FUNC INT DIA_Addon_Matt_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Matt_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_DontNeedYou_15_00"); //Ya no te necesito.
	AI_Output (self, other, "DIA_Addon_Matt_GoHome_10_01"); //(quej�ndose para s�) �Necesito un buen trago de ponche!
		
	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_TooFar(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 14;
	condition	= DIA_Addon_Matt_TooFar_Condition;
	information	= DIA_Addon_Matt_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Matt_TooFar_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_01"); //Desde aqu� puedes seguir solo. (c�nico) Capit�n.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_03"); //�Los hombres y yo volvemos al campamento!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_02"); //�Vuelvo al campamento!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 Ich k�nnte 'nen Heiltrank gebrauchen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_Healing(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 15;
	condition	= DIA_Addon_Matt_Healing_Condition;
	information	= DIA_Addon_Matt_Healing_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_Healing_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Healing_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_Healing_10_01"); //(c�nico) �Hola, Capit�n! No me ir�a mal una poci�n curativa.
};






