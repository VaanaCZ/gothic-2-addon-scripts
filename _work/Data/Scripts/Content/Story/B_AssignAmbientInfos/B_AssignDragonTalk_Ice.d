// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Ice_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Ice_Exit_Condition;
	information	= DIA_Dragon_Ice_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Ice_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Ice_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Ice_Exit_20_00"); //Il potere dell'Occhio si è esaurito e così anche il tuo tempo.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_29_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_30_01");

	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");

};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Ice_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Ice_Hello_Condition;
	information	= DIA_Dragon_Ice_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Ice_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Ice_Hello_Info()
{
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_00"); //Come osi disturbare il mio riposo? Devo spingermi ancora più in profondità per essere finalmente lasciato in pace da voi omuncoli?
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_01"); //Un drago parlante. Sia lodato l'Occhio di Innos.
	};
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_02"); //Voi umani siete delle creature curiose. Anche dopo essere stati spazzati via dai venti gelidi della morte, ce n'è sempre qualcuno che risorge dalle ceneri credendo di essere destinato a diventare un eroe.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_03"); //Ma tutto questo finirà presto. Mi assicurerò di persona che nessuno di voi risorga mai più.
	AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_04"); //Fai silenzio. Per il potere conferitomi dal sacro Occhio, ti ordino di rispondere alle mie domande.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_05"); //Ah ah ah. Chiedi dunque. La tua conoscenza non ti aiuterà.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Ice_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Ice_WERBISTDU_Info;

	description	 = 	"Chi sei?";
};

func int DIA_Dragon_Ice_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Ice_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //Chi sei?
	AI_Output			(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //Io sono Finkregh, signore del ghiaccio e della neve. Guardiano della Congrega, e, per finire, tuo carnefice.

};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Ice_BELIAR_Condition;
	information	 = 	DIA_Dragon_Ice_BELIAR_Info;

	description	 = 	"Quale dio servite?";
};

func int DIA_Dragon_Ice_BELIAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Ice_BELIAR_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //Quale dio servite?
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //Quale maledetto dio potrebbe mai consentire a creature spregevoli come te di mettere piede sulla terra?
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //Non preoccuparti di comprendere il significato del nostro raduno, piccolo eroe.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //Non solo Beliar ci ha permesso di trovarci qui, ma è stato lui stesso a ordinarcelo.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //Guidati dalle sue parole sacre, non ci riposeremo finché non sarà fatta la sua volontà.

};

//**********************************************************************************
//		B_AssignDragonTalk_Ice
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Ice (var c_NPC slf)
{
	DIA_Dragon_Ice_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc		= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_BELIAR.npc			= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






