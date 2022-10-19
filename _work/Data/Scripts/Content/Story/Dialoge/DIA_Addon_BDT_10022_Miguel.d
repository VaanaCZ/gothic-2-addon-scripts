//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Co tady d�l�?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu chce�?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Hled� n�co?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Byliny - hled�m byliny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Obvykle hled�m byliny.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Tady v�t�inou rostou sam� u�ite�n� v�ci.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//V�t�ina zdej��ch rostlin je l��iv� a d� se kou�it jako cig�ra z tr�vy z ba�in.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Tehd� za bari�rou jsem pracoval jako alchymista.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Pro� t� hodili za bari�ru?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Pro� t� vlastn� shodili za bari�ru?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Moc jsem si zahr�val s lektvary, kter� pozm��ovaly mysl.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Jednou ve�er si m�j mistr Ignaz omylem spletl m�j 'experiment' s v�nem.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Byl potom na�as tak n�jak, ehm, nevypo�itateln�. A i pak byl z toho v�eho tak n�jak popleten�.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(ho�ce) M�gov� m� za to hodili za bari�ru. ��kali tomu 'b�d�n� v zak�zan� oblasti'.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Co mi m��e� ��ci o t�bo�e?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co bys mi �ekl o t�bo�e?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Nic moc. Nikdy jsem tam s�m nebyl.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Od za��tku tam byli jenom Havranovi lidi. V�ichni ostatn� p�i�li pozd�ji, v�etn� m�, a museli �ekat, a� budou pot�ebovat nov� lidi.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Odkud jsi p�i�el?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Odkud jsi p�i�el?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //No, nejsp� tam odtud co ty. S pir�ty po mo�i.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Tohle �dol� je komplet od��znut�, nen� tu ��dn� spojen� na pevninu.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(zamy�len�) Pravda.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Kdy budou pot�ebovat nov� lidi?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //A kdy budou pot�ebovat nov� lidi?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //No, a� jim bude n�kdo sch�zet.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Kdy� n�koho z kop��� se�ere d�ln� �erv, jdou za n�ma, aby ho n�kdo nahradil.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //Ob�as se taky zab�jej� mezi sebou, ale posledn� dobou u� je to lep��.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Havran n�jak ovl�d� p��stup do dolu, tak�e se tam hned tak n�kdo nedostane.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Ale nev�m p�esn�, jak to funguje, nikdy jsem tam nebyl.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "Co se t��e Fortuna...";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno je p�kn� zmaten� a hodil by se mu n�jak� lektvar na osv�en� pam�ti.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? Ten snad slou�� Havranovi, ne?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Slou��val, ale te� je z n�j troska. A m��e za to Havran.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Havran? Dote�ka jsem o n�m m�l vysok� m�n�n�. No dob�e, ale tady v ba�in�ch nenam�ch�m nic.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//M��u si ten lektvar nam�chat s�m, v t�bo�e je alchymistick� kolona. Sta�� mi jenom recept.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//S t�m receptem opatrn�, p��prava tohohle lektvaru je nebezpe�n�.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Pokud n�co zkaz� nebo tam ned� spr�vn� ingredience, m��e ti z toho vyj�t zabij�ck� dry�k.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//D�m si pozor.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel mi dal recept na n�jak� lektvar, kter� by m�l o�ivit Fortunovu pam��. Ale mohu jej nam�chat, pouze a� budu zn�t v�echny p��sady, jinak by to mohlo m�t smrtonosn� n�sledky.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "M��e� m� n��emu nau�it?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//M��e� m� n�co nau�it?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Nen� �as. Jsem tu, abych z�skal zlato, a dokud se nedostanu do t�bora, mus�m si na �ivobyt� vyd�l�vat prodejem bylin.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Ale kdybys pot�eboval lektvary, n�jak� tady m�m.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"U Miguela mohu nakupovat lektvary a byliny.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



