///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bilgot_EXIT   (C_INFO)
{
	npc         = VLK_4120_Bilgot;
	nr          = 999;
	condition   = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_HALLO_Condition;
	information	 = 	DIA_Bilgot_HALLO_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};
func int DIA_Bilgot_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hej, odkud p�ich�z�? P�ich�z� z hradu?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Ano, p�ich�z�m z hradu - pro�?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Zavedla m� sem cesta...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Prost� m� sem cesta zavedla.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Chlap�e, sem nikoho cesta JEN TAK nezavede. Jsme tady tot�ln� v h�ji - v�ude kolem jsou ch�apavci!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Nen� dne, aby jeden z n�s ne�el k �ertu.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Nechce� mi ��ct, odkud p�ich�z�? Dobr� - a� si t� vezmou ch�apavci!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Ano, p�ich�z�m z hradu - pro�?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Jak to tam vypad�?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //O nic l�p ne� tady. Sk�eti jsou tam po��d, pokud mysl� tohle.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Zatracen�. �lov�k nen� nikde v bezpe��.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //N�co ti �eknu. Kdybych nebyl posran� strachy, prosekal bych se odtud.
	
	Info_ClearChoices	(DIA_Bilgot_HALLO);
};
///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  3;
	condition	 = 	DIA_Bilgot_Job_Condition;
	information	 = 	DIA_Bilgot_Job_Info;
	permanent 	 =  FALSE;
	description	 = 	"A co tady vlastn� d�l�?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //A co tady vlastn� d�l�?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Jsem tady d�v�e pro v�echno. Chod�m okolo a sleduju ch�apavce, Bilgote sem, Bilgote tam.
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //M�l jsem rad�i z�stat doma se svou starou. Nebylo to sice o moc lep��, ale aspo� tam bylo n�co po��dn�ho k j�dlu.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //A te� jsem v�echno, co zbylo z Fajethov�ch ozbrojenc�.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Jak jsem m�l v�d�t, �e se tahle v�prava nevr�t�?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //M�j p��tel Olav se vypa�il. Mo�n� mu to vy�lo.
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  3;
	condition	 = 	DIA_Bilgot_Hilfe_Condition;
	information	 = 	DIA_Bilgot_Hilfe_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co v� o ch�apavc�ch?";
};
func int DIA_Bilgot_Hilfe_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Bilgot_Hilfe_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Co v� o ch�apavc�ch?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //Pro� to chce� v�d�t? A ne��kej mi, �e jsi jenom zv�dav�!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Chyst�m se na ty ch�apavce vyrazit.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //To je bl�znovstv�. Pozoroval jsem je - jsou to krve��zniv� bestie.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //�ekni mi, co o nich v�.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hm... mohl bych ti pomoci - ale jen pod jednou podm�nkou!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Co chce�?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Kdy� dok�e� zab�t ch�apavce, mus� m� odsud dostat!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Nem��u se tady d�le zdr�ovat. U� jsi mluvil s Fedem? Ten chlap je troska - a j� nechci dopadnout jako on!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////

instance DIA_Bilgot_KNOWSLEADSNAPPER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  4;
	condition	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent 	 =  FALSE;
	description	 = 	"�ekni mi, co v�. Potom t� odtud dostanu!";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //�ekni mi, co v�. Potom t� odsud dostanu!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //V�d�l jsem, �e s tebou m��u po��tat. Tak d�vej pozor. N�jakou dobu jsem ty ch�apavce pozoroval.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Jsou hodn� mazan� a n�jak se spolu... domlouvaj�. Nikdy nechod� sami a �to�� pouze ve skupin�.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Ale je tu je�t� n�co. Je mezi nimi je�t�r, kter� je �pln� jin�. Ukazuje se jen z��dka, ale j� ho vid�l.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Ostatn� bestie se klan�, kdy� je m�j� - ale nikdy ho nespust� z o��.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Dokud se nepohne tenhle, tak ani ��dn� jin�.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Kde najdu tuhle zatracenou bestii?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Vid�l jsem ji u schod� do star� str�n� v�e.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Dobr�. Mysl�m, �e rozum�m. D�ky!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Pamatuj, dal jsi mi slovo!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelf�hrer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot se domn�v�, �e v�dce ch�apav�� sme�ky nejsp� najdu na schodech star� str�n� v�e."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot chce, abych ho dostal z �dol�.");
		
};
///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  2;
	condition	 = 	DIA_Bilgot_TAKEYOUWITHME_Condition;
	information	 = 	DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent 	 =  FALSE;
	description	 = 	"(Dodr�et slib.)";
};
func int DIA_Bilgot_TAKEYOUWITHME_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
 	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
 			{
				return TRUE;
 			};
};
func void DIA_Bilgot_TAKEYOUWITHME_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Je �as, Bilgote! Sbal si sv� v�ci, odch�z�me.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Gro�artig! Es reicht mir schon, wenn du mich �ber die gro�e Br�cke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //Jsem p�ipraven!

	Npc_ExchangeRoutine	(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags	= 0;	
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  5;
	condition	 = 	DIA_Bilgot_LAUFSCHNELLER_Condition;
	information	 = 	DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent	 =  FALSE;
	description	 = 	"Nem��e� j�t trochu rychleji?!";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN))==FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Nem��e� j�t trochu rychleji?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Jdu tak rychle, jak jen m��u.
};
///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<8000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Tak, jsme tady. Te� natref�me na cestu. Tahle oblast je nebezpe�n�!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //D�ky!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Nenech se se�rat. To by byla �koda.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //Sbohem!
	
	AI_StopProcessInfos (self);	
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP (XP_BilgotEscort);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self, "FLEEOUTOFOW");
};
///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_LetztePause_Condition;
	information	 = 	DIA_Bilgot_LetztePause_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tady d�l�? Myslel jsem, �e jsi m�l nam��eno p�es pr�smyk?";
};

func int DIA_Bilgot_LetztePause_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<1000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Co tady d�l�? Myslel jsem, �e jsi m�l nam��eno p�es pr�smyk?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //U� nem��u d�l. Nech m� na chv�li vydechnout. J� to zvl�dnu. Neboj se!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Kdy� to ��k�.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Jen malou p�est�vku.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_Olav_Condition;
	information	 = 	DIA_Bilgot_Olav_Info;
	permanent	 = 	FALSE;
	description	 = 	"Na�el jsem Olava.";
};

func int DIA_Bilgot_Olav_Condition ()
{
	if (Npc_HasItems (Olav, ITSE_Olav) == 0)	
	&& (Npc_KnowsInfo (other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Na�el jsem Olava.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //A jak se m�?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Je mrtv�. Se�rali ho vlci.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Ale, zatracen�. Douf�m, �e se mi aspo� poda�� dostat se odtud.
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bilgot_PICKPOCKET (C_INFO)
{
	npc			= VLK_4120_Bilgot;
	nr			= 900;
	condition	= DIA_Bilgot_PICKPOCKET_Condition;
	information	= DIA_Bilgot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Bilgot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_BACK 		,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};
	
func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};



