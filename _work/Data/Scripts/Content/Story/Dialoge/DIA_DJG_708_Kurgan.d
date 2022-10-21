
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
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hej! Tacy jak ty powinni uwa¿aæ, gdzie ³a¿¹.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Co chcesz przez to powiedzieæ?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //A to, ¿e tutejszy klimat niespecjalnie sprzyja zdrowiu. Tu siê a¿ roi od orków i przeró¿nych potworów.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Nie wspominaj¹c ju¿ o smokach. Potraktuj to jako przyjacielsk¹ radê i lepiej st¹d zniknij.
	B_LogEntry (TOPIC_Dragonhunter,"Na skraju Górniczej Doliny spotka³em grupê ³owców smoków. S¹ dobrze uzbrojeni, ale nie s¹dzê, aby zrobi³o to jakieœ wra¿enie na smokach.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Czy mo¿esz mi powiedzieæ coœ, czego jeszcze bym nie wiedzia³?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Czy mo¿esz mi powiedzieæ coœ, czego jeszcze bym nie wiedzia³?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Mogê ci daæ dobr¹ radê, i to w dodatku za darmo.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Niepotrzebny nam tutaj miêczak mdlej¹cy po us³yszeniu najcichszego smoczego b¹ka.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //IdŸ do domu, to jest robota dla prawdziwych mê¿czyzn.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Czy to ty jesteœ tutaj szefem?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Czy to ty jesteœ tutaj szefem?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //A czy wygl¹dam na szefa? Na pewno nie. Nie potrzebujemy ¿adnych zarozumia³ych wypierdków, którzy mówiliby nam, co mamy robiæ.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Kiedy Sylvio próbowa³ odgrywaæ rolê szefa, bardzo szybko pokazaliœmy jemu i jego kole¿kom, co na ten temat s¹dzimy.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //W koñcu opuœcili nasze towarzystwo.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Mam nadziejê, ¿e Sylvio skoñczy³ w zupie jakiegoœ orka.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"A wiêc chcesz zabijaæ smoki?";

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
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //A wiêc chcesz zabijaæ smoki?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //M¹drala. S¹dzisz, ¿e to takie ³atwe?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Pewnie myœlisz, ¿e taka bestia usi¹dzie sobie cichutko i zaczeka, a¿ obetniesz jej g³owê?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Zabijanie smoków wymaga ogromnego doœwiadczenia i zdolnoœci planowania.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Rozumiem. A jak dok³adnie przebiega takie polowanie?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Najpierw musimy znaleŸæ smoki.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Dopiero gdy wiemy, gdzie siê znajduj¹, mo¿emy zastanowiæ siê nad najlepszymi metodami ataku.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "Z wielk¹ chêci¹ bym popatrzy³, ale muszê ruszaæ w dalsz¹ drogê.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Jak zamierzasz przejœæ obok orków?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Ty pewnie nie potrafisz znaleŸæ nawet œlepej owcy.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Ty pewnie nie potrafisz znaleŸæ nawet œlepej owcy.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Co? Czy chcesz, ¿ebym ci przy³o¿y³ w tê twoj¹ kretyñsk¹ buŸkê?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Jak zamierzasz przejœæ obok orków?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Takimi szczegó³ami bêdziemy siê zajmowaæ póŸniej.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //Z wielk¹ chêci¹ bym popatrzy³, ale muszê ruszaæ w dalsz¹ drogê.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Lepiej zawróæ, jeœli nie chcesz straciæ rêki lub nogi.

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

	description	 = 	"Widzia³eœ ju¿ kiedyœ smoka?";
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
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Widzia³eœ ju¿ kiedyœ smoka?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Nie, ale te bestie nie mog¹ siê wiecznie ukrywaæ.
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
	description	= "Wszystkie smoki nie ¿yj¹.";
				
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
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Smoki nie ¿yj¹.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, kto je niby zabi³? Paladyni?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Ja.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //Ha-ha. Jasne, oczywiœcie. Daj spokój, kogo próbujesz nabieraæ?
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




