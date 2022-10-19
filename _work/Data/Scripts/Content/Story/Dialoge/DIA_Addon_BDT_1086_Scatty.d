//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "Jak jdou obchody?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Jak jdou k�efty?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Od t� doby, co se otev�ela ta hrobka, se nikdo po zbo�� moc nesh�n�.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Havran u� nem� pro otroky vyu�it�, proto te� doluj� zlato. Na Bloodwyn�v rozkaz.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//A kop��i si z toho nic ned�laj. (muml�) Bezstarostn� kop��i nejsou dobr� pro obchod.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty prod�v� r�zn� zbo��.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "Bloodwyn? On to tady vede?";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn? On to tu vede?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Dohl�� na d�l, ale sem dol� skoro nikdy nechod�. V�t�inou b�v� v chr�mu s Havranem.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Co p�esn� mysl� t�m "skoro nikdy"?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Naposledy jsem ho vid�l, kdy� vy�el z hrobky.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(rychle) ...ne, vlastn� po�kej! Naposledy tu byl, kdy� poslal otroky dolovat zlato.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Na rozd�l od Havrana ho toti� zlato nesm�rn� zaj�m�.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "Co je to za hrobku?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//Z jak� hrobky?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//Z proklet� hrobky! Jej� str�ci zabili spoustu lid�!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Str�ci? To mluv� o t�ch kamenn�ch oblud�ch? Celkem placat�, s kulatou hlavou?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Jo, to je p�esn� ono! Vyno�ovali se z kamene po tuctech.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//U� od za��tku jsem v�d�l, �e jsme tu hrobku m�li nechat na pokoji.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Jen�e Havran byl t�m kop�n�m p��mo posedlej. A kdy� jsme hrobku kone�n� odkryli, napochodoval tam i se svejma str�ema.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "A co cht�l Havran v hrobce?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Co Havran v t� hrobce cht�l?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(zaraz� se) Hmm, se� p�kn� zv�davej. P�ipom�n� mi jednoho chl�pka, kter�ho jsem kdysi zn�val.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Ten byl taky tak zv�davej. A� ho to nakonec zni�ilo.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Mluv k v�ci, co se stalo v t� hrobce?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//No, ehm... m�m d�sn� vyschlo v hub�...
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hele, Scatty, TE� NE. Tohle je d�le�it�! Co tam Havran cht�l?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//No dob�e. (zhluboka se nadechne) On... n�co... n�co vyvolal. Po��d p�itom hul�kal ��kou ciz� �e��.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Najednou hrobku osv�tilo jasn� sv�tlo a pak jsem sly�el v�k�ik, kterej byl jak r�na do hlavy - d�monickej v�k�ik.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//A pak?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//V�c u� nev�m. Pak z t� hrobky vylez Bloodwyn a �ek mi, abych vypadnul. A to jsem taky ud�lal.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Netrvalo douho a Havran i jeho chlapi zmizeli zp�tky v chr�mu. Od t� doby u� Havrana nikdo nevid�l.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "Nedal by sis n�co k pit�?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Dal by sis n�co k pit�?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Pivo by bodlo, ale tady v t�bo�e asi t�ko ��k� bude.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Mo�n� �e Lucia je�t� n�jak� korbl�k m�.
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "Na zdrav�. (p�edat pivo)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Tady m�.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Mmm, to je dobr�. D�ky, se� m�j hrdina.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Vz�t krump�� a rubat zlato, to um� ka�dej.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Ale spousta nugget� se t�mhle zp�sobem rozbije. A proto by to m�li d�lat jenom ti, kte�� dolov�n� trochu rozum�j.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//A� bude� trochu zku�en�j��, m��u t� nau�it v�c.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "Nau�it se dolovat zlato (Cena: 2 VB/10 procent)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Pov�z mi n�co v�c o dolov�n� zlata.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//P�edev��m bys m�l v�d�t, �e zlato nen� ruda. Je m�kk� jako m�slo. Kdy� ude�� moc tvrd�, v�ecko se rozsype.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Ka�dej kop�� m� vlastn� triky, jak z kamene dostat co nejv�t�� zlat� valouny.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//Tyhle triky koneckonc� d�laj rozd�l mezi oby�ejn�m kop��em a dobr�m kop��em.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//A hlavn� plat�, �e u�en� d�l� mistra. Jedin� kdy� bude� n�jakou chv�li kopat, p�jde ti to l�p.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "Bloodwyn je mrtv�.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn je mrtvej.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hm, moc lidem bych to nep��l, ale Bloodwyn je lep�� mrtvej..
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};


