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

	AI_Output			(self, other, "DIA_Dragon_Ice_Exit_20_00"); //Die Kraft des Auges ist erloschen und deine Zeit ist nun abgelaufen.

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
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_00"); //Warum störst du meine Ruhe? Muss ich mich noch weiter eingraben, damit ich endlich Ruhe vor euch lästigen Winzlingen habe?
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_01"); //Ein sprechender Drache. Dem Auge Innos' sei Dank.
	};
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_02"); //Ihr Menschen seid ein so seltsames Volk. Hinweggefegt durch den Odem des Todes, findet sich doch immer noch jemand, der sich aus der Asche erhebt und sich zum Helden berufen fühlt.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_03"); //Aber das wird bald ein Ende haben. Ich werde persönlich dafür sorgen, dass so bald keiner von euch mehr aufsteht.
	AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_04"); //Sei still. Mit der mir verliehenen Macht des heiligen Auges befehle ich dir, meine Fragen zu beantworten.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_05"); //Ha, ha, ha. Frag du nur. Dein Wissen wird dir nichts nützen.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Ice_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Ice_WERBISTDU_Info;

	description	 = 	"Wer bist du?";
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
	AI_Output			(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //Ich bin Finkregh. Herr über Schnee und Eis, Hüter der Zusammenkunft und zu guter Letzt dein Tod.

};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Ice_BELIAR_Condition;
	information	 = 	DIA_Dragon_Ice_BELIAR_Info;

	description	 = 	"Welchem Gott dient ihr?";
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
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //Welchem Gott dient ihr?
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //Welcher verfluchte Gott konnte es überhaupt zulassen, dass ihr verachtenswerten Kreaturen auf dieser Erde wandelt.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //Mach dir keine Mühe, den Sinn unserer Zusammenkunft zu verstehen, kleiner Held.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //Beliar hat es nicht nur zugelassen, dass wir jetzt hier sind, er hat es uns sogar befohlen.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //Beflügelt von seinen heiligen Worten werden wir nicht eher ruhen, als dass wir seinen Willen in die Tat umgesetzt haben.

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






