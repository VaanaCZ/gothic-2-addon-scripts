
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //K� t� Adanos prov�z�.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Kone�n� jsi tady � d�ky Adanovi. U� jsme mysleli, �e se tu neuk�e�.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(zmaten�) Co�e? Jak to, �e u� jsi TADY?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Pro�el jsi port�lem a my t� hned n�sledovali. Netrvalo dlouho a dorazili jsme i sem.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Po tob� ale nebylo ani vidu. U� jsme tu n�kolik dn�.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(p�ekvapen�) N�KOLIK DN�? Jak je to mo�n�?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Kdy� jsme t� nikde nemohli naj�t, Nefarius za�al p�trat, kde se stala chyba. A zmaten� je z toho a� dote�.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Ale hlavn� �e jsi tady a m��eme za��t pracovat.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co se mezit�m stalo?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co se stalo mezit�m?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Nasb�rali jsme spoustu nov�ch informac�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Ta zem�t�esen� jsou tu skute�n� SILN�J��. U� nejsme daleko od epicentra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Stavitel� t�chto star�ch budov tu kdysi postavili cel� m�sto, aspo� co zat�m m��eme ��ci.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Z n�jak�ho d�vodu v�ak jejich civilizace zanikla.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Pro�, to se zat�m m��eme jen dohadovat.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Na�li jste n�jakou stopu po t�ch poh�e�ovan�ch?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co Havran?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //A co Havran?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //Havran se v dopise zmi�oval o n�jak�m chr�mu a �e se sna�il dostat dovnit�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //V�ichni jsme toho n�zoru, �e ten chr�m, kter� chce Havran znesv�tit, pat�� Adanovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Ta zem�t�esen� jsou ur�it� v�sledkem ��belsk�ho zakl�n�n�, kter� se st�etlo s mocn�m kouzlem.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Br�ny chr�mu jsou magicky uzav�eny a tohle je ta sam� magie, kter� probouz� ty kamenn� str�ce.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Chr�m se br�n� s�m. Mus�me Havrana zastavit, je�t� ne� pronikne do nejsv�t�j�� svatyn�.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co bude d�l?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Havran je b�val� rudobaron, ��dn� m�g.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co chce Havran v tom chr�mu naj�t?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Havran v tom chr�mu vlastn� chce?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder M�chtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir k�nnen davon ausgehen, dass er nichts Gutes im Schilde f�hrt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //V�me jen to, �e to m� n�co spole�n�ho s mocn�m artefaktem, kter� je n�jak spojen s Adanem a Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(zarputile) Jist� je jenom to, �e rozhodn� nejde po ni�em dobr�m.
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Havran je jen b�val� rudobaron, ��dn� m�g. Jak zrovna ON m��e prov�st takovouhle invokaci?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Mo�n� nen� s�m, t�eba podplatil n�jak�ho odpadl�ho m�ga.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //A� je to, jak chce, MUS�ME p�edch�zet zlu.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Na�el jsi n�jakou stopu po t�ch poh�e�ovan�ch?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Jen v�era jsme na�li ryb��ovo t�lo. Le�elo pod jednou z t�ch rozvalin na v�chod�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Nejsp� �lo o ryb��e z Khorinidu. M�l by ses na to pod�vat.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co bude d�l?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //MY z�staneme tady a budeme d�l studovat tu starobylou kulturu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Ty star� texty stavitel� obsahuj� spoustu tajemstv�, kter� mus�me odhalit. Pokud tedy chceme zjistit, co se tam tenkr�t stalo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Mezit�m pro n�s ale mus� zjistit p�r v�c�.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co m�m ud�lat?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Co m�m d�lat?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Mus� naj�t Havrana a postarat se, aby nemohl znesv�tit Adan�v chr�m.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //T�m mysl�, �e ho m�m ZAB�T.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Pokud to bude jedin� zp�sob, jak ho zastavit, pak v Adanov� jm�nu ANO!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Jinak sb�rej v�echny star� relikvie a p�semnosti, kter� tu sta�� stavitel� zanechali, a p�ines n�m je.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Mus�me zjistit v�c o tomto lidu a odhalit d�vod, pro� ode�el.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Havranovy pl�ny mus�me nap�ed zn�t, abychom jim mohli �elit.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Krom toho mus� zjistit, jak osvobodit otroky.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cynicky) A to je v�ecko? To zvl�dnu levou zadn�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(otr�ven�) J� v�m, �e po tob� chceme moc. Ber to jako �anci znovu z�skat mou d�v�ru.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran znesv�cuje posv�tn� Adan�v chr�m. Mus�m ho zastavit, i kdybych ho p�itom m�l zab�t."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, abych osovodil otroky."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas m� po��dal, abych mu p�inesl cokoliv, co by mohlo odhalit n�co bli���ho o d�vn�ch stavitel�ch."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Tak j� p�jdu.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Tak j� tedy p�jdu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Je�t� n�co � Havran se obklopil spoustou bandit�.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //B�hem tv� nep��tomnosti dorazil dal�� �len kruhu vody.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Poslali jsme ho do ba�iny. Je�t� se nevr�til.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Po��t�me, �e banditi napadnou ka�d�ho, kdo nebude vypadat jako oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Tak�e si po�i� brn�n� bandit�.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //To je jedin� zp�sob, jak se k nim p�ibl�it, ani� by t� napadli.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Banditi st��l� na ka�d�ho, kdo nepat�� mezi n�. Jestli se k nim m�m dostat, mus�m si nap�ed opat�it jejich zbroj."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"Co za chud�ka jste poslali do t�ch ba�in?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //A kter�ho chud�ka jste do t� ba�iny poslali?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Jmenuje se Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Ob�v�m se, �e se moc daleko nedostal.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas poslal do ba�in n�jak�ho Lanceho a te� se boj�, �e se asi moc daleko nedostal."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"Kde bych na�el zbroj bandit�, kter� by mi sedla?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Kde najdu zbroj bandit�, kter� by mi padla?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na z�pad� by m�l b�t t�bor pir�t�.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Pokud v�me, jsou s bandity v kontaktu.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Ne�ekl bych, �e t� napadnou, sotva se k nim p�ibl��.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Mo�n� tam najde� n�jakou pomoc.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas tvrd�, �e by mi s tou zbroj� mohli pomoci pir�ti."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"Na�el jsem Lanceovo t�lo.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Na�el jsem Lancovo t�lo.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //K� jeho du�e vstoup� do kr�lovstv� Adanova.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Dej pozor, synu. U� nechci oplak�vat ��dnou dal�� smrt.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Tady je Lance�v akvamar�nov� prsten.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Tady je Lanc�v akvamar�nov� prsten.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Rad�i mi ho dej, a� nepadne do nespr�vn�ch rukou.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co se t��e t�ch relikvi�...";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Co se t��e t�ch relikvi�...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Mysl�m, �e tu pro tebe n�co m�m.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Tyhle kamenn� tabulky u� zn�me. Nic nov�ho u� se z nich nedov�me.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Mus� jich b�t je�t� v�c.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //A co TOHLE?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //To vypad� dob�e. Kde jsi to na�el?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"P�edal jsem Saturasovi n�sleduj�c� relikvie:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Banditi tyhle kamenn� tabulky pou��vaj� jako m�nu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Nesou znamen� velk�ho v�le�n�ka Quarhodrona.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Je velitelem toho, jeho� syn Rhademes zp�sobil p�d cel�ho m�sta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(pohrdav�) Tss. Vsad�m se, �e ti banditi ani nev�d�, s ��m to vlastn� obchoduj�.
				Log_AddEntry (TOPIC_Addon_Relicts,"�ervenou tabulku, kter� bandit�m slou�� jako platidlo. Nese jm�no mocn�ho v�le�n�ka Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tyhle tabulky jsem na�el v budov� na jihu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //�, tabulka str�c� smrti. Byli to pr�v� oni, kte�� vyvolali duchy mrtv�ch.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Stavitel� byli velmi siln� spojeni se sv�mi p�edky.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Tyhle tabulky jsem na�el v budov� na jihoz�pad�.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Soud� podle t� tabulky to m� n�co spole�n�ho s ubikacemi pro m�stsk� kn�ze.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Velekn�z se jmenoval KHARDIMON. Moc o n�m zat�m nev�me.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Tohle le�elo v budov� u velk� ba�iny.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Nejsp� to b�val d�m l��itel�.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Moc o nich nev�me. Nejsp� zmizeli jako prvn�.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Tohle le�elo ve velk� budov� hluboko v rokli.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //B�vala to knihovna d�vn�ho lidu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Evidentn� tabulka u�enc�.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Spousta p�semnost�, kter� jsme na�li, se odkazuje na v�dce jak�si kasty u�enc�.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Zvl�tn� je, �e nikde nen� zm�n�no jeho jm�no.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //V�born�. Obraz tohoto m�sta u� se n�m pomalu vyjas�uje, ale je�t� st�le nev�me dost.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Ur�it� tu mus� b�t n�kde ukryto p�t t�chto kamenn�ch tabulek.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Najdi je a p�ines mi je.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Tady m� za odm�nu trochu zlata.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Te� u� jsme z�skali v�echny relikvie, kter� pot�ebujeme.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Prok�zals n�m velkou slu�bu. D�kuji ti.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Tohle bude rozhoduj�c� krok v na�ich studi�ch.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Uvid�m, jestli se d� n�co d�lat.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dob�e, ale posp� si, �as hraje proti n�m.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dob�e �e jsi p�i�el. Objevili jsme nov� v�ci, o kter� se s tebou mus�me pod�lit.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Tak to vyklopte.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //To potopen� m�sto kdysi neslo jm�no Jharkendar. Spravovalo je p�t vl�dc�, kte�� se vz�jemn� d�lili o moc nad sv�m lidem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Ka�d� z nich m�l vlastn� s�dlo, kde �il a kde uchov�val sv�j majetek.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //P�i hled�n� relikvi� se proto mus� soust�edit zejm�na na jejich s�dla.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A co kdy� ty domy u� d�vno neexistuj�?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Kde bych m�l ta s�dla hledat?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Kde bych ta s�dla na�el?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Strukturu jharkendarsk�ch staveb studuje Riordian.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Pov� ti, kde bys m�l ta s�dla hledat.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, abych prohledal s�dla stavitel� a poohl�dl se tam po n��em u�ite�n�m. Kde se ty stavby nach�zej�, se m�m optat Riordiana."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A co kdy� u� neexistuj�?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Pokud nenajde� domy, pak jsou pravd�podobn� poh�beny spolu s m�stem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale pokud st�le existuj�, mohou b�t pro na�e studia neoceniteln�m p��nosem.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"Pro� pot�ebuje� t�ch p�t kamenn�ch tabulek?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Pro� pot�ebujete t�ch p�t kamenn�ch tabulek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Z�znamy, kter� jsme v t�chto rozvalin�ch na�li, nejsou �pln�.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale p�semn� z�znamy stavitel� hovo�� o p�ti vl�dc�ch, kte�� toto m�sto spravovali.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Jako symbol moci nosil ka�d� z nich jednu z t�chto tabulek.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Mysl�m, �e na t�ch tabulk�ch najdeme odpov�di na na�e ot�zky.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius ��kal n�co o povodni.";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius mi vypr�v�l o povodni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Je ps�no, �e s�m Adanos sestoupil z nebes, aby ztrestal nev���c� a vyhnal je do ��e mrtv�ch.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Ve sv�m bo�sk�m hn�vu dopustil, aby mo�e vystoupilo z b�eh� a stavitele tohoto m�sta smetlo z povrchu zemsk�ho.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //P�ipom�nkou t�chto d�vn�ch ud�lost� je ba�ina na v�chod�.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"Co mohlo Adana tolik rozzlobit?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Co mohlo Adana tak rozzu�it?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Chr�m v tomto m�st� b�val kdysi velkou a slavnou stavbou.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Ka�d� zde uct�val boha Adana a modlil se k n�mu.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Av�ak Rhademes, syn velitele Quarhodrona, tento chr�m znesv�til.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Spousta lid� pak podlehla svod�m zla.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Po��t�m, �e Adanos mu ten �in neodpustil a jeho hn�v dopadl na celou zemi.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //T�m sp�e je d�le�it� Havrana zastavit, proto�e ten se chyst� u�init to sam�.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co se t��e Havrana...";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Co se t��e Havrana...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Byl jsem v t�bo�e bandit� na v�chod�. Havran je jejich velitelem.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Ale nap�ed mus�m z cesty odklidit p�r bandit�, jinak se k Havranovi nedostanu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dob�e, tak hodn� �t�st�. A nezapome�, �e to mus� zvl�dnout co nejrychleji.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Havran nesm� sv�j pl�n uskute�nit za ��dnou cenu.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //M� tam zlat� d�l a v�zni mu v n�m t�� zlato.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To je mu podobn�. Mus�me odtamtud ty v�zn� dostat.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(povzdech) Ano, samoz�ejm�. Pracuju na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Mezi bandity je i jeden chl�pek, co tvrd�, �e v�, co m� Havran v pl�nu.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Jmenuje se Fortuno. Havran se pr� chce dostat do chr�mu a ukr�st tam n�jak� velice mocn� artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //A v� o tom artefaktu n�co bli���ho?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Prozradil mi jen, �e Havran nechal otev��t hrob Adanova kn�ze.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Tam by se m�l nach�zet kl�� ke chr�mu. M�l by ses tam porozhl�dnout.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Havran v�zn� p�inutil, aby vykopali kn�z�v hrob.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //To nen� dobr�. Mus� si posp�it a Havrana zastavit.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Dostal jsem se do Havranova obydl�.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //A co? Co Havran?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //P�i�el jsem p��li� pozd�. P��mo p�ed o�ima mi zmizel do Adanova chr�mu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(znepokojen�) Co�e? Tak to je KATASTROFA! Pro� jsi ne�el za n�m?

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Chce� mi ohl�sit n�co nov�ho?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Zat�m nic.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Rad�m ti, nepodce�uj Havrana, rozum�?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"Nemohl jsem n�sledovat Havrana!";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nemohl jsem za n�m. Zablokoval vchod zevnit�.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(chvatn�) Mus�m uva�ovat.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Ot�zka zn�, jak se Havran dostal do chr�mu.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co ud�lal, ne� pro�el port�lem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //P�ednesl p�ed br�nou n�jak� za��k�n�.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A je�t� p�edt�m?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otev�el poh�ebn� m�stnost.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //To u� jsem ti �ekl.
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Spr�vn�!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //V�m jen, �e tam ur�it� provedl n�jak� ritu�l.
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(p�em��l�) Ritu�l.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(kone�n� na to p�i�el) Ano! To je ono!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Ob�v�m se, �e si Havran p�ivlastnil moc str�c� smrti.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //O chr�mu se dozv�d�l od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Mus� j�t za Myxirem a tohle v�echno mu pov�d�t!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Havran z�skal moc str�c� smrti. O Adanov� chr�mu se dozv�d�l od n�jak�ho ducha. Mus�m zaj�t za Myxirem a zpravit ho o tom.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"Mluvil jsem s Quarhodronem.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Hovo�il jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //A co ��kal?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Pom��e mi, jedin� kdy� naleznu odpov�� na jeho ot�zky.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //A kde je tedy probl�m?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nev�m jist�, zda ty odpov�di zn�m.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hmm, v�me, �e na severu m�sta si u�enci vybudovali knihovnu.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Velmi pe�liv� zaznamen�vali v�echny tehdej�� ud�losti.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Snad tam najde� i odpov�di, kter� po tob� Quarhodron chce.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas se domn�v�, �e odpov�di na Quarhodronovy ot�zky najdu v knihovn� u�enc�, kter� le�� daleko na severu."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"Ten probl�m s branou do chr�mu u� jsem vy�e�il.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Probl�m s chr�mem u� je vy�e�en.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //A promluvil ten duch?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Ano, promluvil.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Pak tedy u� v�, jak se dostat do chr�mu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Spr�vn�. A taky mi prozradil, co v chr�mu najdu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Hovo�il o mocn�m me�i, kter� je ukryt v Adanov�ch komnat�ch.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(zoufale) P�i Adanovi! Jsme to ale tupci! Jak jsme mohli b�t tak hloup�!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(rozt�esen�) Ty n�znaky v z�znamech.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(vzru�en�) Ten me� m��e b�t jedin� Beliar�v dr�p.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Mus�me se co nejd��v dostat do t�ch komnat a zmocnit se t� zbran�!
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to je ten 'Beliar�v dr�p'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co jsou to komnaty Adanovy?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co je to ten Beliar�v dr�p?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Je to zt�lesn�n� zla. D�lo samotn�ho BELIARA!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Ka�d�, kdo jej nos�, m� v rukou n�stroj stra�liv� zk�zy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //��m mocn�j�� je jeho nositel, t�m v�t�� s�lu v sob� taj� i Dr�p.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jeho kouzlu odol� pouze ten, jeho� duch je siln� a v�ra neoblomn�.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Te� u� je mi jasn�, pro� stavitel� toto �dol� uzav�eli.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //P�inesli do m�sta zk�zonosnou zbra� a podlehli jej� zl� moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Ti namy�len� bl�zni se pak z nenasytnosti navz�jem pobili.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Krutosti nebraly konce, dokud na celou zemi nedopadl Adan�v hn�v a v�e nezatopilo mo�e.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Jasn�. Tv�rci port�lu ud�lali dob�e, �e tyto v�ci ukryli p�ed zbytkem sv�ta.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Jak� tragick� konec to postihl tak ��asnou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //U� si uv�domuje�, jak je tv�j �kol nal�hav�?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Havran je siln� bojovn�k a nav�c je zaslepen� touhou po moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //V jeho rukou bude Dr�p stra�liv�m n�strojem zk�zy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nesm� se k t� zbrani dostat, jinak bude v�e ztraceno.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"V Adanov� chr�mu je ukryta mocn� zbra�. ��k� se j� 'Beliar�v dr�p'. N�co tak mocn�ho se Havranovi nesm� dostat do rukou."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //A co jsou ty Adanovy komnaty?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Nyn� u� v�me, �e vchod nen� jedinou p�ek�kou, kter� n�m br�n� ve vstupu do chr�mu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //V samotn�m chr�mu jsou t�i komnaty, kter� maj� odradit v�echny vet�elce.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Kl��em jsou barevn� relikvie stavitel�.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Pouze kdy� shrom�d�me v�echny relikvie a roz�e��me jejich h�danky, dostaneme se do vnit�n� svatyn� chr�mu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nev�m, zda Havran u� tyto h�danky roz�e�il, ale pokud se mu to poda�ilo, pak m�me velk� probl�m.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"Co p�esn� bych m�l s t�mi relikviemi v chr�mu d�lat?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co p�esn� bych m�l s t�mi relikviemi v chr�mu d�lat?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //V�me p��li� m�lo. Ale doufejme, �e a� se dostane� do chr�mu, zjist� s�m, k �emu slou��.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Lituji, �e ti nemohu ��ci v�ce. V�echno u� je te� na tob�.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Seber relikvie a okam�it� se vydej do chr�mu.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas m� poslal do Adanova chr�mu s p�ti relikviemi stavitel�, abych se dostal skrze jeho komnaty a zastavil Havrana."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //K� t� milosrdn� Adanos prov�z�.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Snad je�t� nen� p��li� pozd�.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Zem�t�esen� ustala a jak vid�m, je�t� st�le jsi mezi �iv�mi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Znamen� to, �e jsi ve sv�m sna�en� usp�l?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Ano. Havran je mrtv�.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Tak�e u� je to za n�mi. D�ky Adanovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Vedl sis dob�e, synu. Jsme ti velice zav�z�ni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Vyrval jsi ze sp�r� zla velmi mocnou zbra� a znovu nastolil rovnov�hu v tomhle kout� sv�ta.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Kdy� zem�t�esen� ustala, diskutovali jsme, co by se te� m�lo st�t, a do�li jsme k z�v�ru.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //B� a vezmi si Beliar�v dr�p. Od nyn�j�ka jej m��e� nosit.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //Ve tv�ch rukou se n�m snad stane mocn�m spojencem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //U��vej ho moud�e, m�j synu. K� ti Adanos pom��e.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My z�staneme zde a postar�me se, aby chr�m brzy dos�hl sv� b�val� skv�losti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Pouze Myxir je na cest� do Khorinidu, aby pomohl Vatrasovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras u� byl ve m�st� p��li� dlouho.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir byl vysl�n, aby pomohl Vatrasovi v p��stavu."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"Osvobodil jsem v�zn�.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Osvobodil jsem v�zn�.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //V�born�. K� se v po��dku vr�t� do vlasti.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"Z�skal jsem 'Beliar�v dr�p'.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Zmocnil jsem se Beliarova dr�pu.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ale nemohu jej nosit.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Beliar�v dr�p je velmi ZVL��TN� zbra�.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //M� vlastn� v�li a v�dom�.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //A ty, kter� nyn� tuto zbra� nos�, jsi jeho p�nem a vl�dcem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Je tvou sou��st� a p�izp�sob� se tv�m schopnostem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale ud�l� to pouze ze sv� vlastn� v�le.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //A k tomu ho m��e p�esv�d�it pouze samotn� BELIAR.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "A pro� by mi m�l Beliar pom�hat?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co m��u s tou zbran� d�lat?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //A co m�m s tou zbran� tedy d�lat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To z�vis� na tob�. Zmocnil ses t�to zbran� a nyn� jsi jej�m p�nem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //M��u ti jen nazna�it, jak� m� mo�nosti.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Bu� ho d� MN� a j� dohl�dnu na to, aby u� nezp�sobil ��dnou dal�� �kodu...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...nebo si p�ivlastn� jeho moc a bude� s n�m bojovat.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Copak tu zbra� nem��e� ulo�it n�kde v bezpe��?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nem��e� tu zbra� uklidit n�kam do bezpe��?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des B�sen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschlie�t, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Kdy� mi ji d�, pak ji zne�kodn�m, aby u� ji nikdo nikdy nemohl zneu��t.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Tak se po��dn� rozmysli, co ud�l�.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mohu d�t Beliar�v dr�p Saturasovi, nebo si jej nechat pro sebe."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //A pro� by mi m�l Beliar pom�hat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Dos�hne� toho pouze modlitbou k Beliarovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale bu� opatrn� � Beliar je z�ke�n�.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Pokud ho rozhn�v�, d� ti sv�j hn�v jaksepat�� poc�tit.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"M�m-li Dr�p podrobit sv� v�li, mus�m se pomodlit k Beliarovi.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co te� bude� d�lat?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Co budete d�lat te�?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Z�staneme tady a postar�me se, aby chr�m dos�hl sv� b�val� sl�vy.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Za ty v�ky jsou jeho st�ny p��mo v �alostn�m stavu.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A co se t��e tebe, m�j synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jsem r�d, �e jsem se v tob� nezklamal. Stal se z tebe ochr�nce rovnov�hy. U� o tom nen� pochyb.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Neb�t tv� odvahy a s�ly, ostrov Khorinis by se potopil. D�kujeme ti a v duchu ti budeme st�le vzd�vat �est.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Nyn� se v�nuj jin�m �kol�m, je� le�� p�ed tebou, a navra� do tohoto sv�ta rovnov�hu a m�r.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Nyn� b� a napl� sv�j osud, ochr�n�e. Na�e modlitby t� budou prov�zet.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Vezmi si 'Beliar�v dr�p' a zni� ho.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Vezmi si Beliar�v dr�p a zni� jej.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak si p�eje�, synu. Dej mi ho.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Tak u� nezp�sob� ��dn� zlo � potop�m jej do mo�sk�ch hlubin.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Adanova moudrost nad n�m bude bd�t.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"M��e� m� zasv�tit do kruh� magie?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //M��e� m� zasv�tit do kruh� magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Tys m�gem ohn�. Co by tomu �ekl Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //To nikdo nemus� v�d�t.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(povzdech) Vid�m, �e to mysl� v�n�, a tak tv� prosb� vyhov�m.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Ale m�m pocit, �e na�e v�d�n� je ve �patn�ch rukou. S mou pomoc� u� nad�le nepo��tej.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Nem�l jsi m� zklamat.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chci postoupit na dal�� magickou �rove�.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chci si osvojit vy��� �rovn� magie.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Ano, jsi p�ipraven vylep�it sv� v�domosti.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Nyn� vstupuje� do druh�ho kruhu magie. K� ti Adanos d� s�lu pou��vat moc, kterou ti ve sv� velkolep� moudrosti prop�j�il.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Ano, te� nastal ten spr�vn� �as. Nyn� vstupuje� do t�et�ho kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Jsi moud�ej�� a m��e� pou��vat nov� a mocn�j�� kouzla. U��vej je opatrn�.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //�as nade�el. Jsi p�ipraven vstoupit do �tvrt�ho kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Mocn� jsou tv� slova i skutky. Nov� kouzla vol v�dy opatrn� a s rozmyslem.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Poskytneme ti v�sadu vstoupit do p�t�ho kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Kouzla, kter� se nyn� nau��, budou skute�n� ni�iv�.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Proto si uv�domuj svou moc a nikdy nepodl�hej velkolep�m iluz�m.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To u� nen� m�j �kol.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //K zasv�cen� do �est�ho a posledn�ho kruhu magie mus� zaj�t do kl�tera ohniv�ch m�g�.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Je�t� je p��li� brzy. Vra� se pozd�ji.
	};
};

















