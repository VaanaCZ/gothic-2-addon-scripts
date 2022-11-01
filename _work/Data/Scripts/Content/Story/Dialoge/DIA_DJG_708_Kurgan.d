
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hej! Tacy jak ty powinni uważać, gdzie łażą.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Co chcesz przez to powiedzieć?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //A to, że tutejszy klimat niespecjalnie sprzyja zdrowiu. Tu się aż roi od orków i przeróżnych potworów.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Nie wspominając już o smokach. Potraktuj to jako przyjacielską radę i lepiej stąd zniknij.
	B_LogEntry (TOPIC_Dragonhunter,"Na skraju Górniczej Doliny spotkałem grupę łowców smoków. Są dobrze uzbrojeni, ale nie sądzę, aby zrobiło to jakieś wrażenie na smokach.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Czy możesz mi powiedzieć coś, czego jeszcze bym nie wiedział?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Czy możesz mi powiedzieć coś, czego jeszcze bym nie wiedział?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Mogę ci dać dobrą radę, i to w dodatku za darmo.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Niepotrzebny nam tutaj mięczak mdlejący po usłyszeniu najcichszego smoczego bąka.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Idź do domu, to jest robota dla prawdziwych mężczyzn.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Czy to ty jesteś tutaj szefem?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Czy to ty jesteś tutaj szefem?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //A czy wyglądam na szefa? Na pewno nie. Nie potrzebujemy żadnych zarozumiałych wypierdków, którzy mówiliby nam, co mamy robić.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Kiedy Sylvio próbował odgrywać rolę szefa, bardzo szybko pokazaliśmy jemu i jego koleżkom, co na ten temat sądzimy.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //W końcu opuścili nasze towarzystwo.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Mam nadzieję, że Sylvio skończył w zupie jakiegoś orka.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"A więc chcesz zabijać smoki?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //A więc chcesz zabijać smoki?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Mądrala. Sądzisz, że to takie łatwe?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Pewnie myślisz, że taka bestia usiądzie sobie cichutko i zaczeka, aż obetniesz jej głowę?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Zabijanie smoków wymaga ogromnego doświadczenia i zdolności planowania.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Rozumiem. A jak dokładnie przebiega takie polowanie?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Najpierw musimy znaleźć smoki.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Dopiero gdy wiemy, gdzie się znajdują, możemy zastanowić się nad najlepszymi metodami ataku.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "Z wielką chęcią bym popatrzył, ale muszę ruszać w dalszą drogę.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Jak zamierzasz przejść obok orków?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Ty pewnie nie potrafisz znaleźć nawet ślepej owcy.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Ty pewnie nie potrafisz znaleźć nawet ślepej owcy.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Co? Czy chcesz, żebym ci przyłożył w tę twoją kretyńską buźkę?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Jak zamierzasz przejść obok orków?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Takimi szczegółami będziemy się zajmować później.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //Z wielką chęcią bym popatrzył, ale muszę ruszać w dalszą drogę.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Lepiej zawróć, jeśli nie chcesz stracić ręki lub nogi.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Widziałeś już kiedyś smoka?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Widziałeś już kiedyś smoka?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Nie, ale te bestie nie mogą się wiecznie ukrywać.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Wszystkie smoki nie żyją.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Smoki nie żyją.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, kto je niby zabił? Paladyni?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Ja.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //Ha-ha. Jasne, oczywiście. Daj spokój, kogo próbujesz nabierać?
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};




