///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Hej, nem�m �as tady s tebou kl�bosit. Jestli chce� n�jak� informace, promluv si s Kardifem.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Hele, chlape, prost� m� nech na pokoji, dobr�?
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //Nem�m dojem, �e bych t� nepoznal jen proto, �e m� jin� hadry!
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //(spiklenecky) Ty r�d strk� nos do v�c�, do kter�ch ti nic nen�, co?!
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //Ztra� se!
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "Kardif ��kal, �e pro m� mo�n� bude� m�t n�jakou pr�ci.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif ��kal, �e pro m� mo�n� bude� m�t n�jakou pr�ci.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //Tady v p��stavu nen� pro kl�tern� pan�ky na pr�ci v�bec nic (sm�ch).
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //Tady v p��stavu nen� pro kr�lovsk� voj�ky na pr�ci v�bec nic.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//(zkoumav�) Dobr�, dobr�, tak ty se poohl�� po n�jak� speci�ln� pr�ci�ce. Ale hraje se podle mejch pravidel, jasn�?
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//Co to znamen�?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//To znamen� to, �e ud�l�, co ti �eknu, a dostane� t�etinu zisku.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Jestli se ti to nel�b�, nic pro tebe nem�m.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"Jsme obchodn� partne�i, tak�e hezky fifty-fifty. ",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"Dobr�, ty jsi ��f.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//Dobr�, ty jsi ��f.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Fajn, dej mi v�d�t, a� bude� p�ipravenej na nahrab�n� hromady pen�z.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Jsme par��ci, tak�e fifty-fifty.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//Jo, jasn�, stejn� jsem si myslel, �e to tak bude. Samoz�ejm� �e se spravedliv� rozd�l�me.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "Fajn, jakej je pl�n?";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Fajn, jakej je pl�n?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Zn� obchodn�ka Baltrama, ne? Jestli ne, tak je na�ase si s n�m promluvit.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Ten Baltram m� posl��ka, kterej ho z�sobuje zbo��m z Akilovy farmy.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//Teda, M�L posl��ka, dokud jsem ho nepod��z. A te� si Baltram sh�n� nov�ho. A t�m bude� ty.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Nech� se Baltramem najmout a vezme� tu dod�vku od Akila.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//P�inese� mi ji a j� ji pak prod�m jednomu zaj�mav�mu z�kazn�kovi. D� n�m za to po��dnou sumi�ku zlata.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//A nepokou�ej se to prodat s�m. Je ti v�echno jasn�?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Tak dobr�, jdeme na to. (KONEC)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Kde najdu Baltrama?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Kdy si m�m s Baltramem promluvit?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Kde je Akilova farma?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"A kolik mi to vynese?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//Kde je Akilova farma?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Opust� m�sto v�chodn� branou. Je to ta p��mo u tr�i�t�.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Kdy� p�jde� po cest� napravo, brzo naraz� na n�kolik stup�� vytesan�ch do sk�ly.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Vyjdi po nich a naraz� na Akilovu farmu.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//Kolik n�m z toho kouk�?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//P�esn� t�ko ��ct. Ale tak kolem 400 zlat�ch.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//Kde najdu Baltrama?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//M� sv�j st�nek na tr�i�ti.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//Kdy si m�m s Baltramem promluvit?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//M��e� j�t hned te�. U� by m�l v�d�t, �e se jeho posl��ek u� nikdy neuk�e. (sprost� sm�ch)
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//Tak teda dobr�, jdu na to.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Fajn, tak jdi - ale jestli se m� pokus� podv�st, bude� �pln� stejn� mrtvej jako ten posl��ek! Nezapome� na to!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Mus�m Baltrama p�im�t, aby m� p�ijal jako nov�ho posl��ka. Pak mus�m p�ebrat z�silku od farm��e Akila a p�edat ji Nagurovi.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "P�inesl jsem ten bal�k.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//P�inesl jsem ten bal�k.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Dobr� pr�ce. Zkus�m to prodat. Vra� se z�tra.
	
	B_LogEntry (TOPIC_Nagur,   "Nagur p�ijal z�silku. Zaplat� mi z�tra.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "Prodal jsi teda to zbo��?";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//Prodal jsi teda to zbo��?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Jo, ale za m��, ne� jsem myslel. Dostal jsem jen 300 zlat�ch.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//Kus z toho je pro moje zam�stnance.
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//A Kardif dostane sv�j obvykl� pod�l - plus zlato na tvoji provizi.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//Co� nakonec d�l� 240 zlat�ch. Rozd�l�me si to, jak jsme se dohodli. Tady je tv�j d�l.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Odvedl jsi dobrou pr�ci. Nechal jsem na to sv�ch zam�stnanc�ch.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Co se na tom vyd�l�, u� nijak neovlivn�m.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//Ne, je�t� ne. Tahle v�c chce sv�j �as. Chci po tom v�em dostat dobrou cenu.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "Kdo jsou tv� zam�stnanci?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//Kdo jsou tv� zam�stnanci?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//V�n� si nemysl�, �e ti to �eknu, �e ne?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//Ten k�eft dopadnul dob�e, ale o sv�ch lidech nemluv�m. Tak�e kl�dek.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//Podvedl jsi m�! To byla velk� chyba - jdi do hajzlu!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(P�edv�st zlod�jsk� sign�l.)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Dok�zals to. Te� v�, kdo jsou m� zam�stnanci.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Dr� se toho, co ti �ekla Cassia - nestar�me se o to, kdo jsou ti ostatn�. Jsi jedn�m z n�s, a na ni�em jin�m nesejde.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Pod�vej se po n�kom jin�m. Potlouk� se tu kolem dost lid�. U� pro tebe nic dal��ho nem�m.
	AI_StopProcessInfos (self);
};
























