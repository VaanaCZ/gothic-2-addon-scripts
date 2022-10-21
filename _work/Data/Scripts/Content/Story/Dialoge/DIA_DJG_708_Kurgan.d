
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
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hej! Tacy jak ty powinni uwa�a�, gdzie �a��.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Co chcesz przez to powiedzie�?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //A to, �e tutejszy klimat niespecjalnie sprzyja zdrowiu. Tu si� a� roi od ork�w i przer�nych potwor�w.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Nie wspominaj�c ju� o smokach. Potraktuj to jako przyjacielsk� rad� i lepiej st�d zniknij.
	B_LogEntry (TOPIC_Dragonhunter,"Na skraju G�rniczej Doliny spotka�em grup� �owc�w smok�w. S� dobrze uzbrojeni, ale nie s�dz�, aby zrobi�o to jakie� wra�enie na smokach.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Czy mo�esz mi powiedzie� co�, czego jeszcze bym nie wiedzia�?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Czy mo�esz mi powiedzie� co�, czego jeszcze bym nie wiedzia�?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Mog� ci da� dobr� rad�, i to w dodatku za darmo.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Niepotrzebny nam tutaj mi�czak mdlej�cy po us�yszeniu najcichszego smoczego b�ka.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Id� do domu, to jest robota dla prawdziwych m�czyzn.
	
};

//**************************************************************************
//	Bist du hier der Anf�hrer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Czy to ty jeste� tutaj szefem?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Czy to ty jeste� tutaj szefem?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //A czy wygl�dam na szefa? Na pewno nie. Nie potrzebujemy �adnych zarozumia�ych wypierdk�w, kt�rzy m�wiliby nam, co mamy robi�.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Kiedy Sylvio pr�bowa� odgrywa� rol� szefa, bardzo szybko pokazali�my jemu i jego kole�kom, co na ten temat s�dzimy.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //W ko�cu opu�cili nasze towarzystwo.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Mam nadziej�, �e Sylvio sko�czy� w zupie jakiego� orka.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen t�ten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"A wi�c chcesz zabija� smoki?";

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
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //A wi�c chcesz zabija� smoki?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //M�drala. S�dzisz, �e to takie �atwe?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Pewnie my�lisz, �e taka bestia usi�dzie sobie cichutko i zaczeka, a� obetniesz jej g�ow�?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Zabijanie smok�w wymaga ogromnego do�wiadczenia i zdolno�ci planowania.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Rozumiem. A jak dok�adnie przebiega takie polowanie?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Najpierw musimy znale�� smoki.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Dopiero gdy wiemy, gdzie si� znajduj�, mo�emy zastanowi� si� nad najlepszymi metodami ataku.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "Z wielk� ch�ci� bym popatrzy�, ale musz� rusza� w dalsz� drog�.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Jak zamierzasz przej�� obok ork�w?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Ty pewnie nie potrafisz znale�� nawet �lepej owcy.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Ty pewnie nie potrafisz znale�� nawet �lepej owcy.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Co? Czy chcesz, �ebym ci przy�o�y� w t� twoj� krety�sk� bu�k�?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Jak zamierzasz przej�� obok ork�w?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Takimi szczeg�ami b�dziemy si� zajmowa� p�niej.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //Z wielk� ch�ci� bym popatrzy�, ale musz� rusza� w dalsz� drog�.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Lepiej zawr��, je�li nie chcesz straci� r�ki lub nogi.

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

	description	 = 	"Widzia�e� ju� kiedy� smoka?";
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
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Widzia�e� ju� kiedy� smoka?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Nie, ale te bestie nie mog� si� wiecznie ukrywa�.
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
	description	= "Wszystkie smoki nie �yj�.";
				
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
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Smoki nie �yj�.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, kto je niby zabi�? Paladyni?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Ja.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //Ha-ha. Jasne, oczywi�cie. Daj spok�j, kogo pr�bujesz nabiera�?
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




