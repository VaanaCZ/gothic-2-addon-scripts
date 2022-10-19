// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Dost âeèí. Tvá doèasná moc vypršela. Oko ztratilo svou sílu. Pâiprav se na smrt.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Další troufalé stvoâení, co se odvážilo vylézt do mých skal. Ty mràavý èlovíèku. Tak stateèný a zároveà tak zranitelný.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Hej, vážnê umíš mluvit.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Vyrvu ti z têla vnitânosti a nadêlám z nich krmení pro krysy.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Ne tak rychle. Mám u sebe Innosovo oko. Budeš mê muset poslouchat a odpovídat na mé otázky.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(âve) Arrh. Ptej se.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Jsem nazýván Pedrakhanem a stáhnu z tebe kùži zaživa, až tê chytím.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Kdo je mezi draky nejsilnêjší?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Kdo je mezi draky ten nejsilnêjší?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Èerpáme svou sílu z elementù tohoto svêta. Jejich hierarchie je jasná a jednoduchá.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Zemê, kterou pokrývá mêkká pùda, poskytla život všem stvoâením pod sluncem. Teë se otevâe a všechny vás pohltí, pokud se dostanete pâíliš blízko.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //Skály, jež by se radêji rozpadly, než by se vzdaly, se pyšnê tyèí k nebi a schovávají samy pâed sebou jistou nedbalost. A ještê poskytují nejlepší ochranu proti pâílivu.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Jiskâièka života dâímá v žáru hlubin tohoto svêta. A teë plameny spálí vše živé a nezùstane nic než popel.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Všechny naše elementy dokáží chránit i nièit. Ale pouze ve vodê, která se mùže stát tvrdou a pevnou jako skála, se vše pâemêní na vêènou nehybnost, kde je život stêží možný.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






