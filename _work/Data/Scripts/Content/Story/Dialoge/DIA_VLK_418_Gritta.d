// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Co chce�, cizin�e? Jestli jsi p�i�el �ebrat, pak t� mus�m zklamat - jsem jenom chud� vdova.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Jmenuji se Gritta. Od t� doby, co mi zem�el man�el, vedu dom�cnost sv�mu str�ci Thorbenovi.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Pos�l� m� Matteo, pr� mu st�le dlu�� n�jak� pen�ze.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Pos�l� m� Matteo, pr� mu st�le dlu�� n�jak� pen�ze.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //On chce sv� pen�ze? A pro�? Zbo��, kter� mi dodal, bylo vadn�, �patn� utkan� a je�t� h��e se�it�.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //A vid�l jsi ty barvy? V�bec se nepodobaly t�m, jak� jsem si objednala! Je to podvod, nic jin�ho!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //�eknu ti, �e kdyby byl na�ivu m�j mu�, Matteo by si nikdy nic takov�ho nedovolil. Ach, m�j uboh� man�el...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokra�ovat...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //...byl to takov� dobr�k. Pohledn�, pracovit� a d�entlmen ze star� �koly. Nic n�m nechyb�lo - byli jsme bohat� a ��astn�...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //...ob�as n�s dokonce zvali i do lep�� spole�nosti. Sam� slavnosti, kr�sn� �aty a ��esy...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //...vybran� j�dla a zdvo�il� konverzace. V�echno bylo tenkr�t lep��. Tehdy by si nikdo nedovolil ur�et nebohou vdovu takov�mi...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokra�ovat...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //...sm�n�mi tvrzen�mi. Co si jen po�nu? Moje renta sta�� jen taktak na p�e�it� a �asy jsou ��m d�l hor��. Je to vid�t v�ude...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //...lid� mus� �et�it, �kudlit a utahovat opasky. U� cel� t�dny do m�sta nedorazila ��dn� lo�. M�j mu� b�val kapit�nem obchodn� lodi - vlastn� ji z�rove� i vlastnil...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //...ze sv�ch cest mi v�dycky vozil d�rky - n�dhern� l�tky z pevniny, vz�cn� ko�en� z ji�n�ch zem�...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokra�ovat...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //...v�t�ina lid� o podobn�ch v�cech nikdy nesly�ela. Ale jednoho dne jsem dostala zpr�vu, �e Gritta se potopila - ano, na�e lo� nesla toto jm�no, m�j mu� t�m d�val najevo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...l�sku, jakou ke mn� choval. Plakala jsem a modlila se, aby m�j drah� to ne�t�st� p�e�il, ka�d� den jsem doufala, �e o n�m t�eba usly��m, ale m� touha byla marn�...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //...k� se Innos smiluje nad jeho du��. A� odpo��v� v pokoji. Od t� doby tu p�eb�v�m v t�chto skromn�ch podm�nk�ch, a te� m� ten bezcitn�, bezohledn� Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...chce p�ipravit o posledn� zbyte�ek m�ch celo�ivotn�ch �spor. Pros�m, smiluj se nad ubohou �enou. Kdyby byl na�ivu m�j mu�, nikdy by si nic takov�ho nedovolil. Ach, m�j uboh� man�el...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"P�esta� s t�m. Kde je to zlato?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokra�ovat...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //P�esta� s t�m. Kde je to zlato?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(vzdorovit�) Ale j� to zlato nem�m, jsem jenom chud� vdova!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Naval prachy, nebo ti jednu vlep�m!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tak to asi budeme muset prodat n�jak� tv�j majetek...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tak j� tu sumu zaplat�m za tebe.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Tak prost� prodej p�r t�ch sv�ch had��k�. Ur�it� jich m� ve sk��ni celou hromadu.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Jak se opova�uje�, ty nevychovan�e! No tak dob�e, tady m� to zlato.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(��klebek) Vida, ani to nebolelo.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(jedovat�) A te� pros�m odejdi z m�ho domu.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Tak j� tu sumu zaplat�m za tebe.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Opravdu bys to pro m� ud�lal? Ach, j� v�d�la, �e nejsi takov� nena�ran� hajzl jako Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //No jo, to nic.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Vra� se, a� to za��d� - chci se ti n�jak odvd��it.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(hroziv�) Naval prachy, nebo ti jednu vlep�m!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(vyz�vav�) Jsi jenom prachsprost� lump. Jen poj�, vytas zbra� a j� zavol�m str�e!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //To od tebe bylo opravdu �lechetn�, �es to za m� zaplatil. Cht�la bych se ti n�jak odm�nit.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Tuhle l�hev v�na mi man�el - nech� Innos dop�eje pokoj jeho du�i - p�ivezl z ji�n�ch ostrov�.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Tak� jsem to v�ude rozhl�sila. Aspo� n�kdo tu m� v t�le kouska cti.
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //No jo, to nic.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Dokud jsou ve m�st� mu�i jako ty, st�le mohu v srdci chovat nad�ji, �e se v�e v dobr� obr�t�.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Vra� se, a� urovn� tu z�le�itost s Matteem.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Co na m� tak blb� �um�? Stejn� si na m� netroufne� za�to�it!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Co je�t� chce�? Moje zlato jsi u� dostal, tak vypadni!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Jak se vede?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //V�ecko jde od des�ti k p�ti. A� se pod�v�, kam se pod�v�, v�ude vl�dne zlo�in a n�sil�. Jen si p�edstav - dokonce zabili jednoho z paladin�!
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"To je v�lka - takov� v�ci se st�vaj�.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"To bude v po��dku.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Co jsi zaslechla?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Ach, lord Hagen toho �old�ka pustil - to m� tak dojalo!
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //A co to m� spole�n�ho s tebou?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Jen se nad t�m zamysli. V���, �e by �old�ci jen tak st�li a d�vali se, jak jim v�� kamar�da?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Ur�it� by se ho pokusili osvobodit, a z toho by koukalo po��dn� krveprolit�. Mohu tedy pouze d�kovat Innosovi.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Paladinov� jsou p�ipraveni a vypad� to, �e se brzy vydaj� na cestu.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //V�echno p�i star�m, ale nechci si st�ovat.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //To je v�lka - takov� v�ci se st�vaj�.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Ano, za v�echno m��e tahle stra�n� v�lka. Ka�d� n�jak trp� a zaj�m� ho, jak se s t�m v��m vypo��daj�.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Ob�as se pt�m sama sebe, za� n�s Innos takhle trest�.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //To bude v po��dku.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //To je od tebe hezk�, �e m� chce� povzbudit.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Co jsi zaslechla?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Jenom to, co si vypr�v�j� lid� na ulici.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Pr� u� chytli toho vraha, ale ne�eknu ti, jestli je to pravda.
};












