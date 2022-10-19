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
	description	 = 	"Co tady dêláš?";
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
	AI_Output (other, self, "DIA_Rengaru_Hauab_15_00"); //Co tady dêláš?
	AI_Output (self, other, "DIA_Rengaru_Hauab_07_01"); //Nejsem si jistej, jestli ti do toho nêco je. Ztraã se!
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
	AI_Output (self, other, "DIA_Rengaru_HALLODIEB_07_01"); //Sakra! Padám pryè!

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
	description	 = 	"Mám tê!";
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
	
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_00"); //Mám tê!
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_07_01"); //Co ode mê chceš?
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_02"); //Okradl jsi Joru za denního svêtla a on si toho ani nevšiml.
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_03"); //Tak jsem ti pâišel âíct, že jsi zavšivenej zlodêj a že...
	
	Info_ClearChoices (DIA_Rengaru_GOTYOU); 
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "Zasloužím si nêjaký podíl na koâisti.", DIA_Rengaru_GOTYOU_Anteil );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "Udêláš líp, když mu to hned vrátíš.", DIA_Rengaru_GOTYOU_YouThief );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "A teë mi âekni, kdo jsi.", DIA_Rengaru_GOTYOU_WhoAreYou );
};
func void DIA_Rengaru_GOTYOU_YouThief ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_YouThief_15_00"); //...udêláš líp, když mu to hned vrátíš.

	if (Npc_HasItems (self, Itmi_Gold) >= 1)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_01"); //Tady jsou prachy, chlape! Ale teë mê nech jít, už to nikdy neudêlám.
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold));
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_02"); //Já už to zlato nemám.
		
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
		{
			AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_03"); //Ale proè ti to vlastnê âíkám? Ty už jsi mê okradl!
		};
	};	
	Info_ClearChoices	(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_15_00"); //...si zasloužím si nêjaký podíl na koâisti.
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
	&& (Npc_HasItems (self, ItMi_Gold) < 1)
	{ 
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_07_01"); //Vzal sis všechno, co jsem mêl u sebe, už když jsi mê srazil na zem! Tak mê nech jít!
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{	//HACK MF. self/other - falsch gesprochen, kein Ersatz...
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_15_02"); //Dobrá, vypadá to, že nemám navybranou. Dám ti pùlku.
		
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "Ne - dáš mi to všechno!", DIA_Rengaru_GOTYOU_Anteil_alles );
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "Fajn, tak mi dej pùlku.", DIA_Rengaru_GOTYOU_Anteil_GehtKlar );
	};
};
func void DIA_Rengaru_GOTYOU_Anteil_alles ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_alles_15_00"); //Ne - dáš mi to všechno!
	
	if (Npc_HasItems (self, Itmi_Gold) >= 2)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_02"); //Takže ty mê chceš okrást. Fajn, tak si to zlato vezmi. A teë mê nech na pokoji.
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
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00"); //Fajn, tak mi dej pùlku.
	
	if B_GiveInvItems (self, other, ItMi_Gold, (Npc_HasItems (self, ItMi_Gold))/2 )
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01"); //Tady je tvoje polovina! A teë mê nech jít!
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02"); //Chtêl bych ti dát polovinu toho zlata, ale já už ho nemám.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};
func void DIA_Rengaru_GOTYOU_WhoAreYou ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_00"); //...a teë mi âekni, kdo jsi.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_01"); //Jsem jen ubohej chudák, co se snaží vyjít s penêzma, jak se dá.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_02"); //Co ještê mùžu udêlat? Ve mêstê o práci nezavadíš.
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_03"); //Dobrá, to vím. Ušetâi mê toho fàukání!
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
	description	 = 	"Mêl bych tê pâedhodit domobranê.";
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
	AI_Output (other, self, "DIA_Rengaru_INKNAST_15_00"); //Mêl bych tê pâedhodit domobranê.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_07_01"); //Co ještê chceš? Nemám co ztratit! Nech mê jít, chlape!
	
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Proè bych to jako mêl dêlat?", DIA_Rengaru_INKNAST_keinKnast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Postarám se, abys skonèil za mâížema.", DIA_Rengaru_INKNAST_Knast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Ztraã se! A už tady ten svuj ksicht víckrát neukazuj!", DIA_Rengaru_INKNAST_HauAb );
};
func void DIA_Rengaru_INKNAST_HauAb ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_HauAb_15_00"); //Ztraã se! A už tady ten svùj ksicht víckrát neukazuj!
	AI_Output (self, other, "DIA_Rengaru_INKNAST_HauAb_07_01"); //Nebudeš toho litovat! Díky, chlape!
	
	Npc_ExchangeRoutine	(self,"Zaèít"); 	
	AI_StopProcessInfos (self);
	
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
};
func void DIA_Rengaru_INKNAST_Knast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_Knast_15_00"); //Postarám se, abys skonèil za mâížema.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_01"); //(unavenê) Už nechci žádné potíže. Jestli máš dojem, že je to to, co bys mêl udêlat, tak si posluž.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_02"); //(varovnê) Dávej si bacha - mí kamarádi nebudou právê odvázaný z toho, co tady vyvádíš.

	
	Rengaru_InKnast		= TRUE; 	
	
	AI_StopProcessInfos (self);
};

func void DIA_Rengaru_INKNAST_keinKnast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_keinKnast_15_00"); //Proè bych to jako mêl dêlat?
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_01"); //Ve mêstê se vždycky hodí znát ty pravé lidi - a stát na jejich stranê.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_02"); //Mohl bych za tebe ztratit dobré slovo. Víc ani nechci, ani nemùžu udêlat. Zbytek je na tobê.
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
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_01"); //Jen si posluž, ještê si ze mê utahuj. Nakonec stejnê slízneš to, co teë provádíš mnê. Slibuju!
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_02"); //Co ještê chceš? Nic dalšího už jsem neukradl, vážnê, chlape!
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
	description = "(Pâedvést zlodêjský signál.)";
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
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_01");//Tak teë ti nêco âeknu. Jestli chceš nêkomu odlehèit o pár zlaãákù, tak si dávej zvlášã pozor na kupce!
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_02");//Jsou tak nepâíjemnê všímaví, co se týèe jejich vlastních vêcí. Ale mùžu ti dát tip.
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_03");//Pokus se zvolenou vêc jednou rukou otoèit a tou druhou mezitím odvádêj jejich pozornost.
	
	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
	Snd_Play ("LEVELUP"); 
};
