// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Fire_Exit_Condition;
	information	= DIA_Dragon_Fire_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //L'Occhio ha perso il suo potere e tu non arriverai a domani.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;


	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Fire_Hello_Condition;
	information	= DIA_Dragon_Fire_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Fire_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Non riesco a credere che ci sono delle persone che darebbero la loro vita solo per vedere un drago di persona.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Parli abbastanza bene per essere un mostro così ingombrante.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Non sono venuto per vedere te. Ho qualcosa di più importante da fare, mi dispiace.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Non vorrai mica dire che osi sfidarmi?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ah ah ah. Ti spezzerò l'osso del collo.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Non correre troppo, amico mio. Io ho l'Occhio di Innos con me. Non puoi resistere alla mia volontà. Rispondi alle mie domande o la tua agonia sarà insopportabile.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(ruggisce) Argh. Allora fammi le tue ridicole domande finché sei in tempo. Il tuo potere non durerà a lungo.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Chi sei?";
};

func int DIA_Dragon_Fire_WerBistDu_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_WerBistDu_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Chi sei?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Mi chiamo Feomathar e questo è tutto ciò che saprai da me.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Una volta che avrò spezzato l'incantesimo dell'Occhio, tu finirai bruciato.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Dov’è il tuo tesoro?";
};

func int DIA_Dragon_Fire_HORT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_HORT_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Ogni drago ha una dimora in cui radunare i propri tesori. Dove si trova la tua?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //In un posto che ti sarà inaccessibile, non appena mi sarò finalmente liberato dalle catene dell'Occhio.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Conservo il mio tesoro in alto, sulle rupi bollenti, impossibili da raggiungere per un essere umano privo di ali come te.

};


//**********************************************************************************
//		B_AssignDragonTalk_Fire
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Fire (var c_NPC slf)
{
	DIA_Dragon_Fire_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};




