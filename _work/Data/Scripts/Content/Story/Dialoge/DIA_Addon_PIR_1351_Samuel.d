// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Samuel_EXIT(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 999;
	condition	= DIA_Addon_Samuel_EXIT_Condition;
	information	= DIA_Addon_Samuel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
instance DIA_Addon_Samuel_Hello(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 1;
	condition	= DIA_Addon_Samuel_Hello_Condition;
	information	= DIA_Addon_Samuel_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Samuel_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_00"); //Á, nêkdo novej!
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_01"); //Co si dáš? Rum, nebo nêco silnêjšího?
	
	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 			  				Francis
// ************************************************************
instance DIA_Addon_Samuel_Francis(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 2;
	condition	= DIA_Addon_Samuel_Francis_Condition;
	information	= DIA_Addon_Samuel_Francis_Info;

	description	= "Chtêl bych si s tebou promluvit o Francisovi.";
};                       
FUNC INT DIA_Addon_Samuel_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Samuel_Francis_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_00"); //Chtêl bych si s tebou promluvit o Francisovi.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_01"); //Vo tom rádoby kapitánovi mi ani nemluv! 
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_02"); //Celej den sedí na tý svý tlustý prdeli a hraje si na dùležitýho.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_03"); //Všichni bysme rádi vêdêli, co si sakra kapitán myslí, když velení svêâil zrovna JEMU!
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_04"); //Co vod toho náfuky chceš?
};

// ************************************************************
// 			  		In Gregs Hütte (Versteck)
// ************************************************************
instance DIA_Addon_Samuel_Versteck(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 3;
	condition	= DIA_Addon_Samuel_Versteck_Condition;
	information	= DIA_Addon_Samuel_Versteck_Info;

	description	= "Musím se nêjak dostat do Gregovy chatrèe.";
};                       
FUNC INT DIA_Addon_Samuel_Versteck_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Samuel_Francis))
	&& (Francis_ausgeschissen == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Versteck_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_02"); //Musím se dostat do Gregovy chatrèe.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_05"); //(potutelnê) Vážnê? A proè?
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_01"); //Potâebuju zbroj banditù.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_06"); //(smêje se) Francis tê do tý boudy NIKDY nepustí. S kradením Gregovejch vêcí se rovnou rozluè.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_07"); //Pokud...
	AI_Output (other, self,	"DIA_Addon_Samuel_Francis_15_03"); //Co?
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_08"); //...pokud nemáš nêco, co by dovopravdy chtêl.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_09"); //Vím, že ve vopuštêným dole v kaàonu si Francis nêco schoval.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_10"); //Když jsme spolu drželi stráž a von si jako dycky hodil šlofíka, mluvil o tom ze spaní.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_11"); //Nemám tucha, co tam ukryl, ale možná je to pro nêj tak dùležitý, že by tê za to pustil i do tý chajdy.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_12"); //(spokojenê) Až se kapitán vrátí a zjistí, že mu nêco chybí, dá to Francisovi poâádnê sežrat.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Paliè Samuel se zmínil o tajném Francisovê úkrytu, který by mêl být v jednom z dolù v kaàonu. Snad tam najdu nêco, co mi pomùže dostat se do chýše."); 
};

// ************************************************************
// 			  				Rezepte
// ************************************************************
var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Recipe(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 4;
	condition	= DIA_Addon_Samuel_Recipe_Condition;
	information	= DIA_Addon_Samuel_Recipe_Info;
	permanent	= TRUE;
	description = "Mám pro tebe recept.";
};
func INT DIA_Addon_Samuel_Recipe_Condition()
{
	if ( (Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0) )
	|| ( (Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0) )
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_15_00"); //Mám pro tebe recept!
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_14_01"); //Výbornê, mrknu na to. Co je to za recept?
	
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
	if (Samuel_Knows_LousHammer == FALSE) 
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Louùv cloumák",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if (Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Louùv supercloumák",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};
func VOID DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
};
func VOID DIA_Addon_Samuel_Recipe_LousHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //Je od Snafa.
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //Ale to zní strašnê – hned to musím vyzkoušet!
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};
func VOID DIA_Addon_Samuel_Recipe_LousDoubleHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //Opatrnê – je to pêknej zabiják!
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //Hezky mê dêsíš, ale stejnê to vyzkouším.
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};

// ************************************************************
// 			  	  				 Grog
// ************************************************************
var int Samuel_Grog_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Grog(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 5;
	condition	= DIA_Addon_Samuel_Grog_Condition;
	information	= DIA_Addon_Samuel_Grog_Info;
	permanent	= TRUE;
	description = "Pâišel jsem si pro svùj pâídêl koâalky. (10 zlatých)";
};                       
FUNC INT DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Samuel_Grog_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Grog_15_00"); //Pâišel jsem si pro svojí koâalku.
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{	
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_01"); //Vy nedáte bez koâalky ani ránu, co? Tak tady máš.
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_02"); //Doufám, že se to dá pít – došla mi totiž èistá voda. Ale trocha slaný vody ještê nikoho nezabila, že jo?
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_03"); //Mùžeš mít koâalky, kolik chceš!
		};
		
		B_GiveInvItems (self,other,ItFo_Addon_Grog,1);
	}
	else //nicht genug Gold
	{
		AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_04"); //Sice je levnej, ale pâeci ne úplnê zadarmo! Napâed si nêco vydêlej, hochu.
	};
};

// ************************************************************
// 			  	  				Rum
// ************************************************************
var int Samuel_Rum_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Rum(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 6;
	condition	= DIA_Addon_Samuel_Rum_Condition;
	information	= DIA_Addon_Samuel_Rum_Info;
	permanent	= TRUE;
	description = "Dej mi àákýho ruma. (30 zlatých)";
};                       
FUNC INT DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_Rum_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Rum_15_00"); //Dej mi rum!
	
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_01"); //Á, mateâský mlíko námoâníkù! Tady je!
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_02"); //Rum bude mít možná tak trochu rybí pâíchuã, protože jediný, co tady máme, sou starý sudy vod herynkù. Ale rum je rum. Na zdraví!
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_03"); //Tumáš.
		};
				
		B_GiveInvItems (self,other,ItFo_Addon_rum,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_04"); //Nemáš dost zlata, èoveèe! Tak co tâeba koâalku?
	};		
};

// ************************************************************
// 			  	  			Was Stärkeres
// ************************************************************
var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Stronger(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 7;
	condition	= DIA_Addon_Samuel_Stronger_Condition;
	information	= DIA_Addon_Samuel_Stronger_Info;
	permanent	= TRUE;
	description = "Chci nêco silnêjšího!";
};
                       
FUNC INT DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func VOID DIA_Addon_Samuel_Stronger_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_00"); //Chci nêco silnêjšího!
	
	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_01"); //Á, tady je nêkdo zvêdavej! Já osobnê si na nový recepty potrpím.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_02"); //Dobrá koâalka musí bejt èistá a silná a spálit ti krk jako tekutej voheà.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_03"); //Ale na tu moc èasto nenarazíš. No, už moc žvaním – dáš si nêco k pití?
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_04"); //Tumáš! Mùj vlastní recept! Chutná? Âíkám mu 'rychlej herynek'.
		B_GiveInvItems (self,other,ItFo_Addon_Schnellerhering,1);
		B_UseItem (other, ItFo_Addon_Schnellerhering);
		AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_05"); //Pùsobivé!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_06"); //(smêje se) To mi mùžeš klidnê ještê zopakovat. 
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_07"); //Ty asi neznáš žádnej dobrej recept na koâalku, co? Jestli jo, tak mi ho musíš prozradit.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_08"); //Dáš si ještê?
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_09"); //Tak jak se ten tvùj dryják jmenuje?
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv supercloumák (60 zlatých)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv cloumák (30 zlatých)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychlý herynek (30 zlatých)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output (self, other, "DIA_Addon_Samuel_NoGold_14_00"); //Žádný prachy, žádnej chlast!
};
// ------------------------------------------------------------

func VOID DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
};
func VOID DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //Dej mi trochu toho tvýho rychlýho herynka.
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //Je to pêknej dryják, ale úèinnej!
		B_GiveInvItems (self, other, ItFo_Addon_SchnellerHering, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv supercloumák (60 zlatých)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv cloumák (30 zlatých)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychlý herynek (30 zlatých)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //Chci Louùv cloumák!
	if (B_GiveInvItems (other, self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //Výborný pití! Až do dna!
		B_GiveInvItems (self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv supercloumák (60 zlatých)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv cloumák (30 zlatých)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychlý herynek (30 zlatých)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //(bezstarostnê) Dej mi dvojitého. Dvojitého cloumáka.
	if (B_GiveInvItems (other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //Jen abys toho nelitoval, hochu. Doufám, že to nechceš pro sebe.
		}
		else
		{
			AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //(divoce) Jo! Nic jinýho èlovêka tak nepovzbudí!
		};

		B_GiveInvItems (self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv supercloumák (60 zlatých)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Louùv cloumák (30 zlatých)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychlý herynek (30 zlatých)", DIA_Addon_Samuel_Stronger_SchnellerHering);	
};

// ************************************************************
// 			  				 Trade 
// ************************************************************
instance DIA_Addon_Samuel_Trade(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 8;
	condition	= DIA_Addon_Samuel_Trade_Condition;
	information	= DIA_Addon_Samuel_Trade_Info;
	permanent	= TRUE;
	description	= "Co dalšího tu ještê máš?";
	Trade		= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Samuel_Trade_Info()
{	
	B_GiveTradeInv (self);

	Npc_RemoveInvItems	(self, ItFo_Addon_Grog, Npc_HasItems (self,ItFo_Addon_Grog) );
	CreateInvItems 	(self, ItFo_Addon_Grog, 15);
	
	AI_Output (other,self ,"DIA_Addon_Samuel_Trade_15_00"); //A co tu máš dál?
	AI_Output (self ,other,"DIA_Addon_Samuel_Trade_14_01"); //Mùžu ti dát nêco, co každej pirát potâebuje k pâežití.
};

// ************************************************************
// 			  	Was gibt's neues im Lager	(PERM)
// ************************************************************
instance DIA_Addon_Samuel_News(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 99;
	condition	= DIA_Addon_Samuel_News_Condition;
	information	= DIA_Addon_Samuel_News_Info;
	permanent	= TRUE;
	description	= "Co je v táboâe nového?";
};                       
FUNC INT DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_News_15_00"); //Co nového v táboâe?
	
	if (Npc_IsDead (Francis))
	|| (Francis_ausgeschissen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_01"); //Francis dostal, co mu patâí! Ani nevíš, jakou z toho mám radost!
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_02"); //Seš správnej chlap – tak pojë, dej si panáka – já to platím!
		if (GregIsBack == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Samuel_News_14_03"); //A Greg se koneènê vrátil. Sice pâišel vo loë, ale aspoà to tu v táboâe zase srovná do latê.
		};
	}
	else //Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead (Morgan))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_04"); //Vod tý doby, co Greg vodjel, se tu nic moc nedêje. Morgan a vêtšina chlapù se tu prostê jen tak poflakujou a celý dny prochlastaj.
		};
		if (!Npc_IsDead (Henry))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_05"); //Jedinej, kdo to všecko vodmaká, je Henry. Von a jeho chlapi totiž stavêj palisádu.
		};
		AI_Output (self ,other,"DIA_Addon_Samuel_News_14_06"); //Nejvyšší èas, aby se vrátil kapitán Greg a poâádnê Francise nakopal do prdele.
	};
};
