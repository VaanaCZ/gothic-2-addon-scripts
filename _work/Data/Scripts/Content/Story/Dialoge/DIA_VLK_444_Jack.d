///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Zdrav�m, ty suchozemsk� kryso, vypad� to, �e z�st�v� tady.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Jsi n�jakej pobledlej kolem �aber.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Nic si z toho ned�lej, k�mo. V�echno, co pot�ebuje�, je dobr� siln� mo�sk� vzduch.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"Co tady d�l�?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_Jack_Job_14_01"); //D��v, kdy� jsem byl je�t� mladej, jsem hodn� �asu tr�vil na mo�i a pro�il spoustu bou��.
	AI_Output			(self, other, "DIA_Jack_Job_14_02"); //P�ed mnoha lety jsem se tu usadil a u� p�knou ��dku let se star�m o khorinidsk� maj�k.
	AI_Output			(self, other, "DIA_Jack_Job_14_03"); //��dnej velkej k�eft. V�bec ne. Ale ta star� v� mi tak p�irostla k srdci, �e u� se v n� c�t�m jako doma.
	AI_Output			(self, other, "DIA_Jack_Job_14_04"); //U� jsem tam naho�e nebyl celou v��nost.
	AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Pro� ne?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Od t� doby, co m�j maj�k obsadili n�jac� budi�kni�emov�, jsem nem�l odvahu se tam dostat bl� ne� na dvacet stop. V�n� hrozn� ch�tra.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Jsou to trestanci z Hornick�ho �dol�, v�ak v�.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Jednou to na druh� stran� hor po��dn� bouchlo a pak zamo�ili celou zem jako kobylky. Te� se ukr�vaj� �pln� v�ude, dokonce i v mym maj�ku.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //M�m dojem, �e vyhl�ej n�jakou lo�, co by mohli vyrabovat.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Ha! A� to ud�laj. Alespo� vypadnou z moj� v�e.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Star� mo�sk� vlk Jack se nem��e vr�tit na sv�j maj�k, nebo� jej obsadili bandit�."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Chod� do m�sta �asto?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //P�ich�z� do m�sta �asto?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //V�dycky ��k�m, �e m�sto je tak dobr�, jak dobrej je jeho p��stav.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //P��stav je br�na do sv�ta. Tady se v�ichni setk�vaj� a tady v�echno za��n�.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Jakmile je p��stav v h�ji, zbytek m�sta dopadne brzo stejn�.
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Pov�z mi n�co o p��stavu.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //�ekni mi n�co o p��stavu.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Khorinidsk� p��stav u� nen�, co b�val.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Nen� tu nic ne� ch�tra, co se poflakuje kolem, u� sem nep�iplouvaj� ��dn� lod� a obchod je mrtvej. Tenhle p��stav je odepsanej.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Pro� u� sem nep�iplouvaj� ��dn� lod�?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co mysl� tou ch�trou?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Tak pro� neodejde�?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Pro� u� sem nep�iplouvaj� ��dn� lod�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //V�ichni ��kaj�, �e a� v�lka skon��, vr�t� se v�echno do starejch kolej�. Jsou to jenom kecy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //��k�m ti, n�mo�n�k pozn�, kdy� to jde s m�stem z kopce.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //N�mo�n�k to c�t� v krvi. A �eknu ti, zapome� na p��stav, ten u� to m� spo��tan�.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co mysl� tou ch�trou?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Koukni na n�, l�n� sebranka. V�t�ina z nich v�bec netu��, co je pr�ce. V�echno, co svedou, je chlastat celej den a posledn� prachy utratit v bordelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //��k�m ti, dr� se od nich d�l.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Tak pro� neodejde�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Nikdo si v tuhle dobu nevezme na palubu takov�ho star�ho mo�sk�ho vlka, jako jsem j�.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //V�t�ina lid� si mysl�, ze starej Jack m� ve svejch prohnilejch kostech dnu.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //A? Je to pravda?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Nesmysl. Jakmile m�m palubu pod nohama, c�t�m se jako mladej jura.
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"Bandit�, kte�� ti obsadili maj�k, u� jsou pry�.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Ti banditi, co zabrali tv�j maj�k, jsou pry�.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Je to v�n� pravda? Kone�n� se m��u vr�tit ke sv� pr�ci.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //P�ij� za mnou na maj�k. Naho�e je kr�snej v�hled na mo�e.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Maj�k");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"M� tady p�knej maj�k.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //M� tady p�knej maj�k.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //D�ky. Prost� vyjdi po v�ech t�ch schodech nahoru a vychutnej si ten n�dhern� v�hled, chlap�e. Jako doma.
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Necht�l by ses vr�tit zp�tky na mo�e?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Necht�l by ses vr�tit na mo�e?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Dal bych pravou ruku za to, kdyby m� je�t� jednou n�kdo najal na velkej �kuner.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale pro takov�ho star�ho mo�sk�ho vlka to nen� tak snadn�, hochu. A stejn�, kdo by se pak staral o maj�k?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevad�. Byl to jen n�pad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Pot�ebuju tvoje n�mo�nick� zku�enosti.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Pot�ebuju tvoje n�mo�nick� zku�enosti.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //U v�ech rozvrzanejch fo�en. Co m� za lubem, chlap�e? Nehodl� si vyzkou�et palubu kr�lovsk� v�le�n� gal�ry, �e ne?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kdo v�?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(sm�ch) To by mohlo n�co znamenat. No dobr�. Nem��u tu ale nechat maj�k jen tak. Mmh. Co s t�m ud�l�me?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Ze star�ho n�mo�n�ka Jacka z p��stavu m��e b�t dobr� kapit�n - nejd��v ale mus�m sehnat n�koho, kdo mu ohl�d� maj�k."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevad�. Byl to jen n�pad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Co kdy� ti n�koho p�ivedu...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //Co kdy� ti se�enu n�koho, kdo se zat�m o maj�k postar�?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //To nen� �patnej n�pad, hochu. A j� takov�ho �lov�ka zn�m.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kov�� Harad m� u�edn�ka jm�nem Brian. U� jsem s n�m hodn�kr�t mluvil.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Cht�l bych sv�j maj�k sv��it pr�v� jemu. Myslim, �e je pro to ten pravej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //B� si s n�m promluvit. Mo�n� budeme m�t �t�st� a ten kluk n�m pom��e.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Nevad�. Byl to jen n�pad.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"Co se t��e Briana...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian je mrtv�.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Ach. Tohle jsou stra�n� �asy. A byli jsme tak dobr� k�mo�i.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian se odte� bude starat o tv�j maj�k.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Doufal jsem, �e to �ekne�.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Je�t� po��d m� pot�ebuje�?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Pod�v�me se, jestli je ten kluk k n��emu dobrej.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"Bu� m�m kapit�nem.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Bu� m�m kapit�nem.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Proplul jsem sedmero mo��, hochu, ale je�t� nikdy jsem nebyl kapit�nem lodi.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //O navigaci nev�m v�bec nic. M�l by ses toho ujmout s�m.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Ud�l�m, co bude v m�ch sil�ch.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Tak mi uka� svou lo� i s pos�dkou. A v� ty v�bec, kam m�me nam��eno? Myslim, jestli m� n�mo�n� mapu?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Po�kej na m� v p��stavu. O zbytek se nestarej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Kdy� to ��k�.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dobr�, starochu. Tak vyplouv�me.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //Dobr�, starochu. Tak vyplouv�me.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //V�echno je v po��dku. Tak mi uka� tu n�mo�n� mapu.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //To bude p�knej v�let. Douf�m, �e se tam dostaneme v jednom kuse.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //M� opravdu v�echno, co pot�ebuje�? Nebudeme se vracet jen proto, �e jsi n�co zapomn�l.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Jestli si se� jistej, �e m�me opravdu v�echno, b� do kapit�nsk� kajuty a dej si dvacet. Prosp�je ti to.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Kl�dek, chlap�e. Je�t� jsem ten �kopek nevid�l. Takhle to nepude.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Nejd��v bude� pot�ebovat kompletn� pos�dku s minim�ln� p�ti chlapama, voln� p��stup na lo� a n�mo�n� mapu. Jinak na to zapome�.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co bude pak?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Co bude pak?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Rozmyslel jsem si to. Z�stanu tady a budu rad�j hl�dat sv�j maj�k.
	
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















