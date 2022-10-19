//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Pravidla zn�. Bez �erven� kamenn� tabulky se nikdo do dolu nedostane.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Na d�l zapome� - chci vid�t Havrana.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Ale i tak tu m�me sv� pravidla a ty se t�kaj v�ech. Dokonce i tebe.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Vra� se. Kdy� se pokus� bez dovolen� vstoupit tam nahoru, str�e t� zabijou. TAKOV� jsou pravidla.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Jestli s t�m m� probl�m, promluv si s Estebanem. M� na starosti t�bor.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "Mus�m se nutn� dostat k Havranovi...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Nutn� se mus�m dostat k Havranovi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//V�n�? Fakt si mysl�, �e se k n�mu dostane�?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jeho str�e maj rozkaz, aby k n�mu NIKOHO nepou�t�ly. Byl bys mrtvej, je�t� ne� by ses k n�mu dostal.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak to pus� z hlavy.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran je v�dcem bandit�. Jestli se k n�mu chci dostat, budu jich muset p�r odklidit z cesty."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Pamatuje� se na m�? Ze Star�ho t�bora...";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Ty se na m� nepamatuje�? Ze Star�ho t�bora?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Tys byl jedn�m z v�z��?! Klidn� jsi moh pat�it i k m� str�i. A to si mysl�, �e z n�s te� d�l� spojence, nebo co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Ne, to ne.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Mo�n� se� ten man�k, co rozbil bari�ru - a mo�n� se� i ten, co pobil m� k�mo�e.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//A co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Ty doby u� jsou pry�.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chce� dovnit�? Tak si se�e� �ervenej k�men a nezdr�uj m�.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "No tak, pus� m� d�l. Kv�li star�m dobr�m �as�m.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //No tak, pus� m� tam. Pro star� dobr� �asy.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //N�co ti vysv�tl�m. V�, pro� jsem je�t� na�ivu?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Proto�e jsem v�dycky v�rnej svejm lidem.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nemus�m souhlasit se v��m, co Havran d�l�, ale mus�m dodr�ovat pravidla. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //A ty taky!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(pevn�) Ne!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "M�m tu pro tebe kamennou tabulku...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//M�m tu pro tebe kamennou tabulku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Tohle nen� ten pravej k�men. D�le�it� jsou jenom ty �erven�.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "M�m tu pro tebe �ervenou kamennou tabulku...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//M�m tu �ervenou tabulku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Fajn.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Ty jsi zabil Estebana, tak�e te� bude� jeho pr�ci d�lat TY!
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//V dole maj� trochu probl�my s d�ln�ma �ervama.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//U� to koupili t�i kop��i a ty se te� m� postarat o n�hradu.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A kdy se kone�n� dostanu do toho zatracen�ho dolu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Nap�ed dokon�i pr�ci a pak si m��e� d�lat, co chce�.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Jeliko� jsem te� nahradil Estebana, m�l bych do dolu poslat t�i kop��e.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "Poslal jsem tam t�i chlapy.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Poslal jsem tam t�i chlapy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//No dob�e. Tak te� si pro m� za m� m��e� j�t dovnit�.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "No teda, co to m� za brn�n�? Kde bych takov� sehnal?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hele, co to m� za zbroj? Kde bych takovou sehnal?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//To nejde. Tuhle zbroj m��ou nosit jenom Havranovy str�e.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Pochybuju, �e by nov� kandid�ti m�li skl�dat ��k� zkou�ky Ale z�v�re�n� rozhodnut� stejn� nez�le�� na mn�, ale na Havranovi.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "Jak se vede v�z��m?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Jak se vede v�z��m?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, ud�lali svou pr�ci. Pokud v�m, te� by m�li kutat zlato.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A co kdy� ute�ou?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//Tak za nima Bloodwyn po�le str�e. Ale pochybuju, �e by byli tak blb� a ut�kali.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Pokud...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Pokud co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//Pokud je k tomu n�kdo nep�im�je. Ale ��dn�ho takov�ho cvoka nezn�m, aspo� dokud je tu Bloodwyn.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Co m� v pl�nu?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Co�e??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Tak�e te� u� jsi z cesty odklidil i Bloodwyna. Jen se pt�m, kdo bude dal�� na �ad�. Havran? Nebo j�?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Boj� se?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Z boje strach nem�m, ale boj�m se n�sledk�, kter� by tv� �iny mohly m�t.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Tenhle t�bor je to jedin�, co n�m je�t� zbejv�.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Mo�n� nefunguje dokonale, ale hlavn� �e ��K funguje.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A s ka�d�m zabit�m zmiz� i ��st na�� komunity.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//My jsme banditi. Vyd�d�nci, zlo�inci, desper�ti.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//P�jdou po n�s, kamkoliv se hneme. Budou se n�s sna�it zav��t a zab�t.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Lep�� m�sto ne� tohle u� pro n�s nen�, a lep�� �as taky ne.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Kam t�m m���?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Tihle chlapi pot�ebujou n�koho, kdo je povede. Kdo by to m�l bejt? Ty? Kdy� se furt cour� z m�sta na m�sto?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Pak se ujmi veden� t�bora ty.";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Pak se ujmi veden� t�bora ty.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//No jo, ale co Havran?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Havran bude m�t brzo �pln� jin� starosti. J� se o n�j postar�m.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Jo, a taky dohl�dni na to, aby v�zni mohli v klidu odej�t z t�bora.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//No dob�e. Postar�m se o v�ecky zdej�� str�e.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn je mrtv� a Thorus se postar�, aby otroci mohli odej�t z t�bora."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Te� si s t�m 'hl�da�em otrok�' promluv�m je�t� jednou, aby Patrick a jeho chlapi mohli odej�t."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"S 'hl�da�em otrok�' u� jsem se vypo��dal a Patrick te� m��e klidn� odej�t i se sv�mi lidmi."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "Zvl�dnul jsem to. Havran u� to m� za sebou.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//A je to. Havran u� to m� za sebou.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//To znamen�, �e jsi Beliarovi zasadil po��dnou r�nu.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Tak�e p�jde� d�l?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje pr�ce v tomhle �dol� skon�ila. Te� bych si r�d p�r dn� odpo�al.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(sm�je se) Jo, ty se� furt na pochodu, co? (v�n�) Tak ��astnou cestu!
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kdo v�, mo�n� na sebe je�t� n�kdy naraz�me.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kdo v�. Je�t� bude� muset proj�t mnoha pr�smykama i chodbama. A v jedn� z nich m� najde�.
	
	AI_StopProcessInfos (self);
	
};



