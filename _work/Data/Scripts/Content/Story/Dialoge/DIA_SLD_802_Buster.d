// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Buster_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_EXIT_Condition;
	information	= DIA_Buster_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Buster_Hello (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_Hello_Condition;
	information	= DIA_Buster_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Buster_Hello_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal geprügelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Kohopak to tady máme? Neznám tę odnękud?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Když myslíš. Jsem na cestę za statkáâem." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "Kdo se ptá?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //Kdo se ptá?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Jsem Buster, jeden z Leeových žoldnéâů!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //A TY bys ke mnę męl být trošku zdvoâilejší, nebo toho budeš litovat!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Dobrá, co tady chceš?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Do toho ti nic není."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Leeho znám!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Jsem pouhým poutníkem, který by si rád promluvil se statkáâem." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Leeho znám!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Leeho zná každý! To nic neznamená, kámo. Zrovna teë mluvíš SE MNOU!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Takže, kam máš namíâeno?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Do toho ti nic není."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Jsem pouhým poutníkem, který by si rád promluvil s hostinským." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Do toho ti nic není.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Takhle se mnou nikdo mluvit nebude, ty červe! Âekl bych, že je čas na poâádnou nakládačku.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Když myslíš. Jsem na cestę za statkáâem.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //Vážnę... Hm - nepâijdeš mi nęjak zvlášă nebezpečný.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chceš to zjistit?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Jednou nebo dvakrát jsem zabil nęjakou pâíšeru."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "To máš pravdu." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //To máš pravdu.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(samolibę) Jo, za ty roky se naučíš si takových vęcí všímat, kámo.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //V jednom kuse tady bojujeme se skâetama. Nebo strážema z męsta. Teda, jsou to pęknę neodbytný prevíti, to teda jo. (zasmęje se)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Myslíš SKUTEČNÉ skâety? Ty velké potvory?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Takže?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Působivé." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Jednou nebo dvakrát jsem zabil nęjakou pâíšeru.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! (zasmęje se) Nejspíš jsi v poli rozšlápnul pár brouků a vyhnal nękolik krys z jejich nor.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Tady nám jdou po krku skâeti! Jo, a ta mizerná męstská stráž. (výsmęšnę se zasmęje)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Myslíš SKUTEČNÉ skâety? Ty velké potvory?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Takže?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Působivé." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Chceš se pâesvędčit
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Božíčku! Vybral jsem si špatného otloukánka, co?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Dalo by se to tak âíct.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Tak pojë, ukaž mi, co v tobę je.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Působivé.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(zasmęje se) To je naše živnost, chlapče! Dokonce si dęláme vlastní zbranę a brnęní!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Vysmíváme se smrti den co den. Ale o nęčem takovém nemá vesnický balík jako ty ani zdání.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Asi ti budu muset ukázat, jak velké ponętí o tom mám!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Když to âíkáš..."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Když to âíkáš...
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(se znudęným zavrčením) Mazej, strašpytle!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Asi ti budu muset ukázat, jak velké ponętí o tom mám!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //To má být jednomužné rolnické povstání, nebo co?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Tak dobrá, ukaž mi, co v tobę je.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Takže?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(odfrkne si) Jako bys vędęl, o čem to tady mluvím. Myslíš si, bůhvíjak nejsi silný, co?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(rozzlobenę) Možná je načase, aby ti nękdo uštędâil lekci!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdykoliv!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Dęlám si srandu..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Myslíš SKUTEČNÉ skâety? Ty velké potvory?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(povzdychne si) Já jenom... Počkat! Chceš si ze mę utahovat?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(s úsmęvem) To vůbec ne.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Ty červe! (nečekanę agresivnę) Nedáš jinak, co?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //Tak pojë a ukaž, co v tobę je, ty hrdino!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdykoliv!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Dęlám si srandu..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //Kdykoliv!
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //Tak pojë blíž, kámo!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Dęlám si srandu.
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //No jo, jasnę, zastrč drápky! Jdi mi z očí!
	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				 FightNone
// ************************************************************

INSTANCE DIA_Buster_FightNone (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_FightNone_Condition;
	information	= DIA_Buster_FightNone_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Buster_FightNone_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Co chceš, strašpytle?
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************

INSTANCE DIA_Buster_Duell (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 3;
	condition	= DIA_Buster_Duell_Condition;
	information	= DIA_Buster_Duell_Info;
	permanent	= TRUE;
	description = "Vyzívám tę k souboji!";
};                       

FUNC INT DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Duell_Info()
{	
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Vyzívám tę k souboji!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha, ha! Nechceš to nechat jen tak, co? Tak dobrá - pojë sem!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Chceš to zkusit znovu? Otravo mizernej - dobrá, pojë sem!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Ale už podruhé neutíkej!
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************
INSTANCE DIA_Buster_WannaJoin (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WannaJoin_Condition;
	information	= DIA_Buster_WannaJoin_Info;
	permanent	= TRUE;
	description = "Chci se pâidat k žoldnéâům!";
};                       

FUNC INT DIA_Buster_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WannaJoin_Info()
{	
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Chci se pâidat k žoldnéâům!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Každý, kdo má ránu tvrdou jako ty, by tady nemęl mít žádné problémy.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Nejsi zrovna nejlepší bojovník, ale odvaha ti rozhodnę nechybí.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Můj hlas tady moc neznamená, protože jsem tady dlouho nebyl, ale až se mę Lee zeptá, budu hlasovat pro tebe.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Teë, když jsem Bustera porazil, už nemá nic proti tomu, abych se pâidal k žoldákům.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Ty? Nevzpomínám si, že by k žoldnéâům kdy pâijali nęjakého sraba.
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Utíkat ze souboje - s tím se tady moc daleko nedostaneš!
		};
	};
};

// ************************************************************
// 		  				 Mehr über Söldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "Rád bych se dozvędęl nęco o žoldnéâích a zdejším okolí.";
};                       

FUNC INT DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
				return TRUE;	
		};
};
 
FUNC VOID DIA_Buster_OtherSld_Info()
{	
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Rád bych se dozvędęl nęco o žoldnéâích a zdejším okolí.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //O okolí ti toho moc nepovím. Na to by ses męl radęji zeptat farmáâů.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //A co se týče nás žoldnéâů - máme jedno velice jednoduché pravidlo: jestli dokážeš neustoupit, můžeš mezi nás.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Myslím, že jsi pâesnę z toho materiálu, který potâebujeme.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Ale ne, aby ti to stouplo do hlavy, že jsi męl v našem posledním souboji štęstí.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Na farmę je spousta hochů, kteâí jsou o chloupek lepší než já.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza, napâíklad. Hlídá vstup na farmu. Aă se dęje, co se dęje, s ním se do kâížku nepouštęj.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ale proč to vlastnę âíkám takovému zbabęlci!
		AI_StopProcessInfos (self);		
	};
};

// ************************************************************
// 		  				About Sentenza		
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;

INSTANCE DIA_Buster_AboutSentenza (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_AboutSentenza_Condition;
	information	= DIA_Buster_AboutSentenza_Info;
	permanent	= FALSE;
	description = "Co s tím Sentenzou?";
};                       

FUNC INT DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_AboutSentenza_Info()
{	
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //Co s tím Sentenzou?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Až pâijdeš na farmu, pokusí se z tebe vymáčknout nęjaké peníze - to dęlá všem nováčkům.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //A být na tvém místę, tak bych zaplatil. Sám jsem to svého času udęlal. Dobré bylo, že mi pak dal svůj hlas.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Âíká, že jedna laskavost vyžaduje druhou. Tenkrát jsem tak pâišel o všechny své peníze, ale nebylo to vlastnę až tak moc. A nakonec jsem byl rád, že to tak dopadlo.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Ve chvíli, když jsem vidęl, jak zmlátil maníka, který se rozhodl NEZAPLATIT.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Díky za radu.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //Rádo se stalo. Má pro tebe nęjakou cenu?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Ne.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Tady máš - 5 zlatých.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Tady máš - 5 zlatých.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Díky, chlape. Zdá se, že si večer budu moc dát pár korbelů. Na to nezapomenu.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Ne.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Myslel jsem si to.
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader		
// ************************************************************

INSTANCE DIA_Buster_LeeLeader (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_LeeLeader_Condition;
	information	= DIA_Buster_LeeLeader_Info;
	permanent	= FALSE;
	description = "Lee je šéf žoldnéâů, ne?";
};                       

FUNC INT DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_LeeLeader_Info()
{	
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee je šéf žoldnéâů, ne?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Pâesnę tak - hej, už jsem si vzpomnęl, odkud tę znám! Tys byl také v kolonii.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(s povzdychem) To jsem byl.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Nevidęl jsem tę, když došlo k tomu velkému tâesku. Ani hodnou chvíli pâedtím.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Męl jsem jiné starosti.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Tos o hodnę pâišel - co jsme byli v lochu, tak se dost vęcí zmęnilo.
};


// ************************************************************
// 		  				 WhatHappened		
// ************************************************************

INSTANCE DIA_Buster_WhatHappened (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WhatHappened_Condition;
	information	= DIA_Buster_WhatHappened_Info;
	permanent	= FALSE;
	description = "Co se stalo se žoldnéâi v kolonii?";
};                       

FUNC INT DIA_Buster_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD)&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WhatHappened_Info()
{	
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Co se stalo se žoldnéâi v kolonii?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Jakmile bariéra padla, vyvedl nás Lee z kolonie. Âíkal, že když budeme držet pohromadę, tak se nám nic nestane. A męl pravdu.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Netrvalo dlouho a našli jsme si tady hezké místečko. Statkáâ nám platí, abychom zametali s domobranou z męsta.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //A vętšina z nás by do toho šla dobrovolnę i zadarmo.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Ale Onar nám dává jídlo a aspoŕ tak můžeme nęjak zabít čas, než se naskytne nęjaká pâíležitost pláchnout z tohohle mizerného ostrova.
};


//**************************************
//			TrainingGold
//************************************** 
INSTANCE DIA_Buster_Teach (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 8;
	condition	= DIA_Buster_Teach_Condition;
	information	= DIA_Buster_Teach_Info;
	permanent	= TRUE;
	description = "Můžeš mę naučit, jak lépe bojovat?";
};                       

FUNC INT DIA_Buster_Teach_Condition()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_1H) <= 60) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_Teach_Info()
{	
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Můžeš mę naučit, jak lépe bojovat?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Možná bych ti mohl dát jednu dvę rady.
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Nejsi tak tupý, jak vypadáš. Dobrá, naučím tę, co vím. Pak možná proti mnę budeš mít nęjakou šanci.
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster mę naučí, jak bojovat jednoručními zbranęmi.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_Back ()
{
	Info_ClearChoices (DIA_Buster_Teach);
};

FUNC VOID DIA_Buster_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP3_EXIT_Condition;
	information	= DIA_Buster_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS		(C_INFO)
{
	npc		 	= Sld_802_Buster;
	nr		 	= 30;
	condition	= DIA_Buster_SHADOWBEASTS_Condition;
	information	= DIA_Buster_SHADOWBEASTS_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition ()
{
	if ((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void B_DIA_Buster_SHADOWBEASTS_OK ()
{
	AI_StopProcessInfos (self);
};

func void DIA_Buster_SHADOWBEASTS_Info ()
{
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hej, ty, chlapče!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Co chceš?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Posledních pár dní jsem pâemýšlel, jak v téhle díâe pâijít k nęjakým snadným penęzům.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //A?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Myslím, že jsem pâišel na to, jak nęjaké prachy získat.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Jeden kupec z męsta vyklopí za jistou vęc pęknej balík.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Co je to za kupce, o kterém mluvíš?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "O co jde?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Proč mi to âíkáš?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Proč mi to âíkáš?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Nemůžu do toho jít sám. Musím zůstat tady a dávat pozor na ty pitomé ovce.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Myslíš farmáâe.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //No vždyă.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //O co jde?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Ten kupec tvrdí, že by mohl na trhu velice dobâe zpenęžit rohy stínové šelmy.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Nękdo bude muset jít do lesa a ty stvůry pokosit. A to je právę práce pro tebe.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Kolik z toho kouká?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Kolik z toho kouká?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Balík penęz, to ti povídám. Bude dost pro nás pro oba.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //A protože jsi mi tenkrát pâinesl to zlato, udęlám ti zvláštní cenu.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //To zní dobâe! Dám ti vędęt, až budu mít nęjaké ty rohy.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster mi nabídl dobrou cenu za každý roh stínové šelmy, který mu pâinesu."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Co je to za kupce, o kterém mluvíš?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Tak to ne, kámo. Byl bych vážnę pitomec, kdybych ti prozradil svůj zdroj. Chceš mę snad podfouknout?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Buë se dohodneš SE MNOU, nebo vůbec. Kapišto?

};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast		(C_INFO)
{
	npc		 = 	Sld_802_Buster;
	nr		 = 	2;
	condition	 = 	DIA_Buster_BringTrophyShadowbeast_Condition;
	information	 = 	DIA_Buster_BringTrophyShadowbeast_Info;
	permanent	 = 	TRUE;

	description	 = 	"K tęm rohům stínové šelmy...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition ()
{
	if (MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItAt_ShadowHorn))||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info ()
{
	if ((Kapitel >= 5))
	{
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Můj kupec nám dal sbohem.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Co to má znamenat?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Je mrtvý. Klidnę si ty rohy nech. Stejnę nevím, co bych s nimi teë dęlal.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Jak mám vykuchat stínovou šelmu?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Ty to nevíš? Teda chlape, čekal jsem od tebe víc.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Pak se k tobę vrátím.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Uč mę.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
	}
	else 
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;
	
		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 	(Shadowbeast.level * XP_PER_VICTORY);			
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; //Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!
		
	
		if (BusterTrophyShadowbeastCount == 1)
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Mám pro tebe roh stínové šelmy.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Mám pro tvého kupce pár dalších rohů stínové šelmy.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Skvęlé. Ukaž. A pâines jich víc. Kdo ví, jak dlouho bude ten kupec tyhle vęci ještę chtít.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Tady je tvůj podíl.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Uč mę.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Tak poslouchej. Zabiješ stínovou šelmu a pak ji pravou rukou chytíš co nejpevnęji za roh.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Potom zarazíš nůž do jejího čela a kolem rohu vyâízneš žlábek.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Nůž potom použiješ jako páku, roh odlomíš a dáš si ho do kapsy.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //No. A pak mi ho pâineseš. To by pro tebe nemęlo být až tak tęžké.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Pak se k tobę vrátím.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //To doufám.
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP4_EXIT_Condition;
	information	= DIA_Buster_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4	
// ************************************************************

INSTANCE DIA_Buster_Perm4 (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_Perm4_Condition;
	information	= DIA_Buster_Perm4_Info;
	permanent	= TRUE;
	description = "Co si myslíš o celé té drakobijecké záležitosti?";
};                       

FUNC INT DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Perm4_Info()
{	
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Co si myslíš o celé té drakobijecké záležitosti?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Hoši by z toho mohli vytâískat docela dost zlata - pokud dâív nezaklepou bačkorama.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Já osobnę se radši držím Leeho.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP5_EXIT_Condition;
	information	= DIA_Buster_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP6_EXIT_Condition;
	information	= DIA_Buster_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Buster_PICKPOCKET (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 900;
	condition	= DIA_Buster_PICKPOCKET_Condition;
	information	= DIA_Buster_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Buster_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Buster_PICKPOCKET);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_BACK 		,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};
	
func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};








































