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

	AI_Output			(self, other, "DIA_Dragon_Ice_Exit_20_00"); //Síla Oka vyhasla a tvùj èas vypršel.

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
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_00"); //Proè rušíš mùj odpoèinek? To se musím vìènì zahrabávat na stále vzdálenìjších místech jen proto, aby mì taková protivná havì jako ty nechala na pokoji?
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_01"); //Mluvící drak. Poehnáno buï Innosovo oko.
	};
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_02"); //Vy lidé jste podivná stvoøení. I kdy vás smete ledovı vichr smrti, vdycky se najde nìkdo, kdo povstane z popela a myslí si o sobì, e je mu dáno bıt hrdinou.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_03"); //Ale to brzo skonèí. Osobnì dohlédnu na to, aby nikdo z vás u nikdy z nièeho nepovstal.
	AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_04"); //Ticho. S mocí posvátného Oka, je mi byla propùjèena, si mùu dovolit zeptat se tì na pár vìcí.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_05"); //Ha, ha, ha. Jen se ptej. Tvé vìdomosti ti nebudou k nièemu.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Ice_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Ice_WERBISTDU_Info;

	description	 = 	"Kdo jsi?";
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
	AI_Output			(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //Jsem Finkregh. Pán ledu a snìhu, stráce shromádìní a konec koncù i tvá smrt.

};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Ice_BELIAR_Condition;
	information	 = 	DIA_Dragon_Ice_BELIAR_Info;

	description	 = 	"Jakému bohu slouíš?";
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
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //Jakému bohu slouíš?
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //Jakı zpropadenı bùh mohl kdy dovolit takovı ohavnı potvoøe jako ty chodit po téhle zemi?
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //Neobtìuj se porozumìt smyslu našeho shromádìní, malı hrdino.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //Beliar nám nejen dovolil, abychom tu byli - on nás dokonce vede.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //Podníceni jeho svatımi slovy si neodpoèineme do té doby, ne se jeho vùle promìní v skutky.

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






