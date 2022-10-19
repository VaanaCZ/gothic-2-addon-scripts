// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Pod�vejme, koho tady m�me. Velk� zast�nce pr�va. Fajn, hrdino, copak tu pohled�v�me?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Hled�m p�r odpov�d�.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Nikdy m� nenapadlo, �e bys sem p�i�el dobrovoln�.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//Co t�m mysl�?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//�e jsem t� hledal. Copak jsi nevid�l ty moje zpr�vy o tom hledan�m chlapovi?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//A na v�ech byl TV�J ksicht. Jojo, d�sn� po tob� tou��me. Copak jsi to nev�d�l?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//N�KDO dal do ob�hu pap�ry s m�m portr�tem a �ekl mi �es to byl ty.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Tak to N�KDO moc mluvil.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Ale m� recht. Ty plak�ty jsou moje pr�ce. A vida, u� t� tu m�me!
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das w�re mein Ende, aber dann tauchte pl�tzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske �berm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldst�cke f�r deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt h�tte, dann h�tte er mich get�tet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//Tak co ode m� chce�?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//J�? Absolutn� nic. Zato m�j ��f se sakra t��, a� bude� mrtvej.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//A tak po mn� chce, abych mu p�inesl tvou hlavu.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "Nev���m ti ani slovo.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//Nev���m ti ani slovo.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//Hele, je to pravda. P��sah�m na hrob sv� matky!
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"Zahl�dli tu n�jak�ho �old�ka jm�nem Patrick.";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //Zahl�dli tu jist�ho �old�ka jm�nem Patrick.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick? Netu��m, o �em to mluv�.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //Vzpom�n�m si na ��k�ho velkohub�ho �old�ka, kterej se tu ob�as poflakoval i se sv�ma kump�nama.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //(o�ividn� l�e) Ale u� jsem ho jak dlouho nevid�l.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //(p�edst�r�, �e je nevinn�) Mo�n� u� toho m�l pln� zuby. Nev�m.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter tvrd�, �e ��dn�ho �old�ka Patricka nezn�."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"Pak je tu ten chl�pek s p�skou p�es oko. A hled� TEBE!";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Je tu ��kej chl�pek s p�skou p�es oko. A hled� TEBE!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //M� hled� ka�dej. Je mi to �pln� fuk.
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Jestli mi ten chlap n�co chce, tak a� p�ijde sem.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"Pr� un�� lidi z Khorinidu.";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //Pr� un�� lidi z Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //Tak tos taky zjistil. Dobr� pr�ce, k�mo.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //A j� myslel, �e jsem zahladil v�ecky stopy.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kdo ti dal ten rozkaz?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kam se ti lidi ztratili? �e by je odvlekli n�kam do dol�?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //Kam ti lidi zmizeli? �e by n�kam do dol� tady v okol�?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //(sm�je se) Jsou daleko na severov�chod�, kam se za nima nedostane�.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Klidn� ti uk�u, kde p�esn� to je, ale nev�m, pro� bys to vlastn� m�l v�d�t.
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //Kdo ti dal tenhle p��kaz?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //M�j ��f. Je to nebezpe�nej chlap. Zn� ho: je to Havran, jeden z bejvalejch rudobaron� ze Star�ho t�bora v Hornick�m �dol�.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Pot�ebuje ty lidi pro sv� pl�ny. V�c v�d�t nepot�ebuje�.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Havran a nebezpe�n�? No jo...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Rudobaron? A tady v Khorinidu?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //Havran a nebezpe�nej? Ale no tak...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //(na�tvan�) Co TY o tom m��e� v�d�t? Nezn� ho tak jako j�!
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //(nejist�) U� tehd� to bejvala hnusn� svin�, ale dneska...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Od p�du bari�ry se zm�nil. M� na tv��i takovej �ernej st�n.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //(ustra�en�) Kdy� se mu d�l d�v� do o��, m� pocit, jako by do tebe zat�nal sp�ry n�jakej dravec.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //M��u ti poradit jedin�: co nejrychlejc vypadni z Khorinidu, ne� bude pozd�.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //(zasmu�ile) Tady nem� co pohled�vat. Pokud teda nehled� jistou smrt.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter nejednal na vlastn� p�st, ale m�l n�jak�ho klienta. Jmenuje se Havran a je to b�val� rudobaron. To on nejsp� v�z� za v�emi t�mi �nosy. Te� o tom ale pot�ebuji z�skat d�kaz."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //Rudobaron? Tady v Khorinidu?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //U� nen� rudobaronem. M� sv� vlastn� pl�ny a Khorinis to za chv�li pozn� taky.
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"Tv�j ��f? A co je za�?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //Tv�j ��f? A kdo to je?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //(sm�je se) To bys cht�l v�d�t, co? To si dok�u p�edstavit.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //(v�n�) Ale nevid�m jedinej d�vod, pro� bych ti to m�l vykl�dat.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "A co te� ud�l�? Zabije� m�?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//A co m� te� v �myslu? Zab�t m�?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//Jo. Ale tys n�s odtamtud v�echny dostal. Proto ti taky d�m je�t� jednu �anci. Zmizni, vypa� se, ud�lej se neviditeln�m. Jdi a u� se mi nikdy nep�iple� do cesty.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Mus�m v�d�t, kam jsi ty lidi odvlekl.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//(sm�je se) No, tak to ze m� zkus vyml�tit.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//(hroziv�) Rad�i bys te� m�l j�t.
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//Jestli t� tu je�t� n�kdy uvid�m, bez rozpak� t� zabiju.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //�ek sis o to.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//Ach jo, chlape. Ud�lal bys l�p, kdyby ses tu neukazoval. Jsi ve �patnou chv�li na �patnym m�st�.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "Chce� mou hlavu? Tak si pro ni poj�!";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //Chce� moj� hlavu? No tak si pro ni poj�!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //Jestli si to fakt p�eje�.

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle �berall unterwegs! Und die suchen dich.
	};
};
*/
