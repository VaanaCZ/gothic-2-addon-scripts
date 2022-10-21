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

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //Oko straci�o swoj� moc. Naciesz si� ostatnimi chwilami �ycia.

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
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Trudno uwierzy�, �e nadal znajduj� si� ludzie gotowi po�wi�ci� w�asne �ycie, byle tylko zobaczy� prawdziwego smoka.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Jak na wielkiego, o�liz�ego jaszczura, jeste� strasznie wygadany.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Nie przyszed�em tu z wizyt� towarzysk�. Uprzejmo�ci musimy chwilowo od�o�y� na bok.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Chyba nie chcesz mi powiedzie�, �e zamierzasz rzuci� mi wyzwanie?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha, ha, ha! Skr�c� ci kark, cz�owieczku!
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Nie tak szybko, przyjacielu. Mam ze sob� Oko Innosa! Nie masz wyboru - odpowiesz na moje pytania albo zdechniesz w m�czarniach.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //Aaarh. Zatem pytaj, p�ki jeszcze mo�esz. Twoja w�adza nade mn� wkr�tce si� sko�czy.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Kim jeste�?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Nazywam si� Feomathar. To wszystko, czego si� o mnie dowiesz.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Spal� ci� na popi�, gdy tylko wyrw� si� spod w�adzy Oka!

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Gdzie jest tw�j skarb?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Ka�dy smok ma miejsce, w kt�rym przechowuje swoje skarby. Gdzie jest tw�j skarb?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //W miejscu, do kt�rego nigdy nie dotrzesz. Postaram si� o to, gdy moc Oka os�abnie.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Ukry�em swoje skarby wysoko na rozgrzanych ska�ach, gdzie nie dotrze �adna pozbawiona skrzyde� istota!

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




