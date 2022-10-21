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

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Dost øeèí. Tvá doèasná moc vypršela. Oko ztratilo svou sílu. Pøiprav se na smrt.

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
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Další troufalé stvoøení, co se odvážilo vylézt do mých skal. Ty mròavý èlovíèku. Tak stateèný a zároveò tak zranitelný.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Hej, vážnì umíš mluvit.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Vyrvu ti z tìla vnitønosti a nadìlám z nich krmení pro krysy.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Ne tak rychle. Mám u sebe Innosovo oko. Budeš mì muset poslouchat a odpovídat na mé otázky.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(øve) Arrh. Ptej se.

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
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Jsem nazýván Pedrakhanem a stáhnu z tebe kùži zaživa, až tì chytím.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Kdo je mezi draky nejsilnìjší?";
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
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Kdo je mezi draky ten nejsilnìjší?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Èerpáme svou sílu z elementù tohoto svìta. Jejich hierarchie je jasná a jednoduchá.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Zemì, kterou pokrývá mìkká pùda, poskytla život všem stvoøením pod sluncem. Teï se otevøe a všechny vás pohltí, pokud se dostanete pøíliš blízko.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //Skály, jež by se radìji rozpadly, než by se vzdaly, se pyšnì tyèí k nebi a schovávají samy pøed sebou jistou nedbalost. A ještì poskytují nejlepší ochranu proti pøílivu.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Jiskøièka života døímá v žáru hlubin tohoto svìta. A teï plameny spálí vše živé a nezùstane nic než popel.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Všechny naše elementy dokáží chránit i nièit. Ale pouze ve vodì, která se mùže stát tvrdou a pevnou jako skála, se vše pøemìní na vìènou nehybnost, kde je život stìží možný.

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






