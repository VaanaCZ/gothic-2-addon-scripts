//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Počkej chvilku.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Máš nęjakej problém?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Důlní červi. Velká spousta důlních červů. Narazili jsme tady na hnízdo.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Proč ty červy nepobít?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//A proč na nę teda nezaútočíme?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//To jsem se taky ptal, ale stráže prý mají na práci 'důležitęjší vęci'.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn poslal mę, abych se o to postaral.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Ty s tęma červama asi bojovat nebudeš.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//A proč? Abysme se dostali ke zlatu v jeskyni?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn si stejnę nejvíc urve pro sebe. A já pro pár nuggetů nemíním riskovat krk.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Jestli ale chceš bojovat s tęma červama, nebudu ti bránit. Akorát koukej, aă je sem všecky nenalákáš, jasný?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Můžeš mi o Bloodwynovi prozradit nęco bližšího?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Můžeš mi povędęt víc o Bloodwynovi?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Jo, je to šmejd, co netouží po ničem jiným než po zlatę. Prohlíží každou novou žílu i každej nugget.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//S takovou hamižností si jednou pęknę nabije držku. A na nás zvysoka sere.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//A jinak?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Hraje si na velkýho machra a nesnese, když je nękdo lepší než von. No, já bych proti nęmu nešel.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Radši mu uhýbej z cesty a neprovokuj ho – pokud ho teda nechceš totálnę vytočit. Pak neví, co dęlá.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn definitivnę odejde z chrámu teprve tehdy, až se v dole najde nová zlatá žíla.");
	B_LogEntry (Topic_Addon_Tempel,"Když se Bloodwyn naštve, úplnę se pâestane ovládat. Toho bych mohl nęjak využít."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "S tęmi červy už je to vyâízené.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Tak tohle bysme męli. Červi už jsou bradou vzhůru.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn už je na cestę. Tak jsi to chtęl, ne?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//No, pobil jsi červy, takže Bloodwyn tu bude cobydup. Takže jestli máš nęco v plánu, musíš to udęlat HNED.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Pęknę jsi mu to ukázal. Výbornę.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Tak to se jdu porozhlídnout po jeskyni.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Čoveče, určitę je tu spousta zlata!
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//K tęm nuggetům tamhle nahoâe se ale dá dostat jenom po žebâíku.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Jenže od pádu bariéry už nikdo žádný žebâíky nepoužívá. To je vážnę pech!
};




