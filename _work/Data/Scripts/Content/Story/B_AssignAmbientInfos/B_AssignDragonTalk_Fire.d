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

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //Oko straci³o swoj¹ moc. Naciesz siê ostatnimi chwilami ¿ycia.

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
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Trudno uwierzyæ, ¿e nadal znajduj¹ siê ludzie gotowi poœwiêciæ w³asne ¿ycie, byle tylko zobaczyæ prawdziwego smoka.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Jak na wielkiego, oœliz³ego jaszczura, jesteœ strasznie wygadany.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Nie przyszed³em tu z wizyt¹ towarzysk¹. Uprzejmoœci musimy chwilowo od³o¿yæ na bok.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Chyba nie chcesz mi powiedzieæ, ¿e zamierzasz rzuciæ mi wyzwanie?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha, ha, ha! Skrêcê ci kark, cz³owieczku!
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Nie tak szybko, przyjacielu. Mam ze sob¹ Oko Innosa! Nie masz wyboru - odpowiesz na moje pytania albo zdechniesz w mêczarniach.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //Aaarh. Zatem pytaj, póki jeszcze mo¿esz. Twoja w³adza nade mn¹ wkrótce siê skoñczy.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Kim jesteœ?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Nazywam siê Feomathar. To wszystko, czego siê o mnie dowiesz.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Spalê ciê na popió³, gdy tylko wyrwê siê spod w³adzy Oka!

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Gdzie jest twój skarb?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Ka¿dy smok ma miejsce, w którym przechowuje swoje skarby. Gdzie jest twój skarb?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //W miejscu, do którego nigdy nie dotrzesz. Postaram siê o to, gdy moc Oka os³abnie.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Ukry³em swoje skarby wysoko na rozgrzanych ska³ach, gdzie nie dotrze ¿adna pozbawiona skrzyde³ istota!

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




