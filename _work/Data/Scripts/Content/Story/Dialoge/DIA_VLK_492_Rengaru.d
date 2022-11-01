///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rengaru_EXIT   (C_INFO)
{
	npc         = VLK_492_Rengaru;
	nr          = 999;
	condition   = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rengaru_PICKPOCKET (C_INFO)
{
	npc			= VLK_492_Rengaru;
	nr			= 900;
	condition	= DIA_Rengaru_PICKPOCKET_Condition;
	information	= DIA_Rengaru_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rengaru_PICKPOCKET_Condition()
{
	C_Beklauen (20, 5);
};
 
FUNC VOID DIA_Rengaru_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice		(DIA_Rengaru_PICKPOCKET, DIALOG_BACK 		,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rengaru_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rengaru_PICKPOCKET);
};
	
func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rengaru_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hauab
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_Hauab		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  2;
	condition	 = 	DIA_Rengaru_Hauab_Condition;
	information	 = 	DIA_Rengaru_Hauab_Info;
	permanent	 =  TRUE;
	description	 = 	"Co tady dęláš?";
};
func int DIA_Rengaru_Hauab_Condition ()
{	
	if (Jora_Dieb != LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Rengaru_GOTYOU) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Rengaru_Hauab_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_Hauab_15_00"); //Co tady dęláš?
	AI_Output (self, other, "DIA_Rengaru_Hauab_07_01"); //Nejsem si jistej, jestli ti do toho nęco je. Ztraă se!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HalloDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_HALLODIEB		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  2;
	condition	 = 	DIA_Rengaru_HALLODIEB_Condition;
	information	 = 	DIA_Rengaru_HALLODIEB_Info;
	permanent	 =  FALSE;
	description	 = 	"Jora âíkal, že máš jeho peníze...";
};
func int DIA_Rengaru_HALLODIEB_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_HALLODIEB_15_00"); //Jora âíkal, že máš jeho peníze.
	AI_Output (self, other, "DIA_Rengaru_HALLODIEB_07_01"); //Sakra! Padám pryč!

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"RunAway");  
};
///////////////////////////////////////////////////////////////////////
//	Info GotYou
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_GOTYOU		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  3;
	condition	 = 	DIA_Rengaru_GOTYOU_Condition;
	information	 = 	DIA_Rengaru_GOTYOU_Info;
	permanent	 =  FALSE;	
	description	 = 	"Mám tę!";
};

func int DIA_Rengaru_GOTYOU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info ()
{
	B_GivePlayerXP (XP_RengaruGotThief);
	
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_00"); //Mám tę!
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_07_01"); //Co ode mę chceš?
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_02"); //Okradl jsi Joru za denního svętla a on si toho ani nevšiml.
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_03"); //Tak jsem ti pâišel âíct, že jsi zavšivenej zlodęj a že...
	
	Info_ClearChoices (DIA_Rengaru_GOTYOU); 
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "Zasloužím si nęjaký podíl na koâisti.", DIA_Rengaru_GOTYOU_Anteil );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "Udęláš líp, když mu to hned vrátíš.", DIA_Rengaru_GOTYOU_YouThief );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "A teë mi âekni, kdo jsi.", DIA_Rengaru_GOTYOU_WhoAreYou );
};
func void DIA_Rengaru_GOTYOU_YouThief ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_YouThief_15_00"); //...udęláš líp, když mu to hned vrátíš.

	if (Npc_HasItems (self, Itmi_Gold) >= 1)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_01"); //Tady jsou prachy, chlape! Ale teë mę nech jít, už to nikdy neudęlám.
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold));
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_02"); //Já už to zlato nemám.
		
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
		{
			AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_03"); //Ale proč ti to vlastnę âíkám? Ty už jsi mę okradl!
		};
	};	
	Info_ClearChoices	(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_15_00"); //...si zasloužím si nęjaký podíl na koâisti.
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
	&& (Npc_HasItems (self, ItMi_Gold) < 1)
	{ 
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_07_01"); //Vzal sis všechno, co jsem męl u sebe, už když jsi mę srazil na zem! Tak mę nech jít!
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{	//HACK MF. self/other - falsch gesprochen, kein Ersatz...
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_15_02"); //Dobrá, vypadá to, že nemám navybranou. Dám ti půlku.
		
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "Ne - dáš mi to všechno!", DIA_Rengaru_GOTYOU_Anteil_alles );
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "Fajn, tak mi dej půlku.", DIA_Rengaru_GOTYOU_Anteil_GehtKlar );
	};
};
func void DIA_Rengaru_GOTYOU_Anteil_alles ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_alles_15_00"); //Ne - dáš mi to všechno!
	
	if (Npc_HasItems (self, Itmi_Gold) >= 2)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_02"); //Takže ty mę chceš okrást. Fajn, tak si to zlato vezmi. A teë mę nech na pokoji.
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold) );
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else 
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_03"); //Dal bych ti to zlato, ale už ho nemám.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00"); //Fajn, tak mi dej půlku.
	
	if B_GiveInvItems (self, other, ItMi_Gold, (Npc_HasItems (self, ItMi_Gold))/2 )
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01"); //Tady je tvoje polovina! A teë mę nech jít!
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02"); //Chtęl bych ti dát polovinu toho zlata, ale já už ho nemám.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};
func void DIA_Rengaru_GOTYOU_WhoAreYou ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_00"); //...a teë mi âekni, kdo jsi.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_01"); //Jsem jen ubohej chudák, co se snaží vyjít s penęzma, jak se dá.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_02"); //Co ještę můžu udęlat? Ve męstę o práci nezavadíš.
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_03"); //Dobrá, to vím. Ušetâi mę toho fŕukání!
};
///////////////////////////////////////////////////////////////////////
//	Info InKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_INKNAST		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr 			 =  4;
	condition	 = 	DIA_Rengaru_INKNAST_Condition;
	information	 = 	DIA_Rengaru_INKNAST_Info;
	permanent 	 =  FALSE;
	description	 = 	"Męl bych tę pâedhodit domobranę.";
};

func int DIA_Rengaru_INKNAST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_15_00"); //Męl bych tę pâedhodit domobranę.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_07_01"); //Co ještę chceš? Nemám co ztratit! Nech mę jít, chlape!
	
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Proč bych to jako męl dęlat?", DIA_Rengaru_INKNAST_keinKnast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Postarám se, abys skončil za mâížema.", DIA_Rengaru_INKNAST_Knast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Ztraă se! A už tady ten svuj ksicht víckrát neukazuj!", DIA_Rengaru_INKNAST_HauAb );
};
func void DIA_Rengaru_INKNAST_HauAb ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_HauAb_15_00"); //Ztraă se! A už tady ten svůj ksicht víckrát neukazuj!
	AI_Output (self, other, "DIA_Rengaru_INKNAST_HauAb_07_01"); //Nebudeš toho litovat! Díky, chlape!
	
	Npc_ExchangeRoutine	(self,"Začít"); 	
	AI_StopProcessInfos (self);
	
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
};
func void DIA_Rengaru_INKNAST_Knast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_Knast_15_00"); //Postarám se, abys skončil za mâížema.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_01"); //(unavenę) Už nechci žádné potíže. Jestli máš dojem, že je to to, co bys męl udęlat, tak si posluž.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_02"); //(varovnę) Dávej si bacha - mí kamarádi nebudou právę odvázaný z toho, co tady vyvádíš.

	
	Rengaru_InKnast		= TRUE; 	
	
	AI_StopProcessInfos (self);
};

func void DIA_Rengaru_INKNAST_keinKnast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_keinKnast_15_00"); //Proč bych to jako męl dęlat?
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_01"); //Ve męstę se vždycky hodí znát ty pravé lidi - a stát na jejich stranę.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_02"); //Mohl bych za tebe ztratit dobré slovo. Víc ani nechci, ani nemůžu udęlat. Zbytek je na tobę.
};
///////////////////////////////////////////////////////////////////////
//	Info LastInfoKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_LastInfoKap1		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  6;
	condition	 = 	DIA_Rengaru_LastInfoKap1_Condition;
	information	 = 	DIA_Rengaru_LastInfoKap1_Info;
	permanent	 =  TRUE;	
	description	 = 	"Tak co? V poâádku?";
};
func int DIA_Rengaru_LastInfoKap1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_LastInfoKap1_15_00"); //Tak co? V poâádku?
	
	if (Rengaru_InKnast	== TRUE)
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_01"); //Jen si posluž, ještę si ze mę utahuj. Nakonec stejnę slízneš to, co teë provádíš mnę. Slibuju!
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_02"); //Co ještę chceš? Nic dalšího už jsem neukradl, vážnę, chlape!
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rengaru_Zeichen   (C_INFO)
{
	npc         = VLK_492_Rengaru;
	nr          = 2;
	condition   = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent   = FALSE;
	description = "(Pâedvést zlodęjský signál.)";
};

FUNC INT DIA_Rengaru_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Rengaru_InKnast == FALSE)
	&& Npc_KnowsInfo (other, DIA_Rengaru_GOTYOU)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_00");//Hej, jsi jedním z nás.
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_01");//Tak teë ti nęco âeknu. Jestli chceš nękomu odlehčit o pár zlaăáků, tak si dávej zvlášă pozor na kupce!
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_02");//Jsou tak nepâíjemnę všímaví, co se týče jejich vlastních vęcí. Ale můžu ti dát tip.
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_03");//Pokus se zvolenou vęc jednou rukou otočit a tou druhou mezitím odvádęj jejich pozornost.
	
	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
	Snd_Play ("LEVELUP"); 
};
