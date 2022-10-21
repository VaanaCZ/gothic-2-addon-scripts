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

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //Oko ztratilo svou moc a ty se nedoèkáš pøíštího dne.

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
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Prostì nemùžu uvìøit, že opravdu ještì existují lidé, kteøí jsou ochotni obìtovat svùj život jen proto, aby na vlastní oèi vidìli draka.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Jsi docela výøeèný - na takovou neskladnou obludu.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Nepøišel jsem se obdivovat tvému zevnìjšku. Mám ponìkud radikálnìjší úmysly, je mi líto.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Nechceš tím øíct, že se mi hodláš postavit?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha, ha, ha. Zlomím ti ten tvùj hubený krèek.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Ne tak rychle, pøíteli. Mám u sebe Innosovo oko. Nemùžeš odolat mé moci. Odpovìz na mé otázky, nebo okusíš nesnesitelná muka.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(øve) Arrgh. Tak se pochlub tìmi tvými otázkami, dokud mùžeš. Tvá moc nebude mít dlouhého trvání.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Kdo jsi?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Jmenuju se Feomathar, a to je vše, co se o mnì dozvíš.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Jakmile uniknu úèinkùm kouzla Oka, užiješ si žáru poøádného plamene.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Tak kde máš ty své poklady?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Každý drak má skrýš, ve které schovává své poklady. Takže, kde ta skrýš je?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //Na místì, o kterém si budeš moci nechat jen zdát, jakmile se zbavím øetìzù toho Oka.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Vzal jsem svùj poklad nahoru na žhavé útesy, které lze nazvat všelijak, jenom ne pøístupnými neokøídlenému èlovíèkovi, jako jsi ty.

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




