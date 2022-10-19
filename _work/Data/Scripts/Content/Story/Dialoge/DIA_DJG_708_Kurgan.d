
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
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hej, ty! Chl�pci jako ty by si m�li d�vat pozor, kam �lapou.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Co se mi to pokou�� ��ct?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //Cht�l jsem t�m ��ct, �e zdej�� ovzdu�� nen� prosp�n� tv�mu zdrav�. Tahle oblast je te� prolezl� sk�ety a dal��ma zr�dama.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //A to nepo��t�m draky. Ber to jen jako dob�e m�n�nou radu.
	B_LogEntry (TOPIC_Dragonhunter,"U vchodu do Hornick�ho �dol� m� p�iv�tala skupina drakobijc�. Byli t�ce ozbrojen�, ale ob�v�m se, �e na draky t�m moc velk� dojem neud�laj�.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"M��e� mi ��ct n�co, co u� bych d�vno nev�d�l?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //M��e� mi ��ct n�co, co u� bych d�vno nev�d�l?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //M��u ti d�t dobrou radu, a to dokonce zdarma.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Nem��em tu pot�ebovat nikoho, kdo se slo�� ze slabou�k�ho dra��ho prdnut�.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Jdi dom�, tohle je pr�ce pro opravdov� chlapy.
	
};

//**************************************************************************
//	Bist du hier der Anf�hrer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Ty jsi tady ��f?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Ty jsi tady ��f?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //Vypad�m tak? Jasn� �e ne. Nepot�ebujeme ��dn�ho nafoukan�ho blba, co by n�m n�co rozkazoval.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Kdy� se Sylvio sna�il chovat jako n� ��f, uk�zali jsme mu i t�m jeho k�mo��m, co si o tom mysl�me.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //Poh�dali jsme se. Nakonec sami ode�li.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Douf�m, �e Sylvio skon�il v kotli s pol�vkou n�jak�ho sk�eta.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen t�ten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"Tak�e ty chce� zab�jet draky?";

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
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(posm�n�) Tak ty chce� zab�t draky?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Bl�znivej osle. Tak ty v�, jak slo�it draka?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //To si mysl�, �e ta bestie si prost� bude jen tak klidn� sed�t ve svym doup�ti a �ekat, a� j� usekne� hlavu?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //N�co takov�ho vy�aduje dobrej pl�n a r�znou akci.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //J� v�m. A jak se s t�m hodl�te vypo��dat vy?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Nejd��v mus�me zjistit, kde tu bestii najdeme.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Teprve pak si m��eme promyslet, jak tu potvoru zab�t.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "To bych cht�l vid�t, ale mus�m se starat o sv� v�ci.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Jak se chcete dostat p�es sk�ety?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "M�m dojem, �e nenajde� ani slepou ovci.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //M�m dojem, �e nenajde� ani slepou ovci.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Co? To chce�, abych ti n�jakou vrazil?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Jak se chcete dostat p�es sk�ety?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Na tyhle v�ci je je�t� dost �asu.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //To bych cht�l vid�t, ale mus�m se starat o sv� v�ci.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //M�l by ses odsud rychle vytratit. Jinak se ti m��e st�t, �e p�ijde� o hn�tu, mo�n� o dv�.

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

	description	 = 	"U� jsi n�kdy vid�l draka?";
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
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //U� jsi n�kdy toho draka vid�l?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Zat�m ne. Ale ta bestie se nem��e schov�vat v��n�.
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
	description	= "Draci jsou mrtv�.";
				
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
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Draci jsou mrtv�.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, a kdo je jako m�l zab�t? Paladinov�?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //J�.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(sm�ch) Ha. Tomu s�m nev���. P�esta� si ze m� utahovat.
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




