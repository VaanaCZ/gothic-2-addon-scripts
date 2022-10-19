///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento klíè by ukradlo i malé dítê.)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hej, poèkej - jsi mi nêjaký povêdomý.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Co chceš?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Tvùj oblièej jsem už nêkde vidêl... ano - už vím!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Tady - tenhle obrázek u sebe mêla skupina banditù, kterou jsme sbalili pâed pár dny. Vypadá vážnê jako ty.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Zdá se, že tê ti chlapíci hledali.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Ne, musel ses splést.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Božínku, nêco takového by mê samotného nikdy nenapadlo.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Ne, to se urèitê pletete. To musel být nêkdo jiný.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Jak myslíš, cizinèe.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Ale jestli se nakonec ukáže, žes na tom obrázku pâece jenom byl TY - a pokud budeš mít nêjaké potíže - snaž se je netahat s sebou do mêsta. Už takhle to tady není žádný med.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //A cizinci, kteâí s sebou pâinášejí potíže, tady moc dlouho vêtšinou nezùstanou - doufám, že jsem se vyjádâil jasnê.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Božínku, nêco takového by mê samotného nikdy nenapadlo.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Vážnê legrace... co od tebe ti chlapíci chtêli?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Zeptejte se jich sami. Máte je pâece v bezpeèí pod zámkem, ne?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Ne - jsou mrtví.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //Tak mám dojem, že se to už nikdy nedozvíme.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //V pâípadê, že bys mêl nêjaké problémy, promluv si s lordem Andrem. Možná by byl schopný ti pomoci. Najdeš ho v kasárnách.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "Co víš o banditech?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Co víš o banditech?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Všichni pocházejí z té zatracené têžaâské kolonie. Je mezi nimi ale nêkolik skupinek odpadlíkù.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Nêkteâí se zašili v horách a další se spojili s Onarem, velkostatkáâem.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Nejvíc potíží ale zpùsobují bandité, kteâí se zdržují mimo mêsto.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //To kvùli nim se teë žádný obchodník neodváží vyrazit za mêstské brány.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "Nevíš nêco o banditech, kteâí okradli obchodníka Hakona?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Nevíš nêco o banditech, kteâí okradli obchodníka Hakona?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Jo TOHLE. Ani mi to nepâipomínej.
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Co víme, tak mají na svêdomí už pêknou âádku útokù na rùzné kupce.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ty krysy zalezly do svých dêr a neodvažují se ani vystrèit nos.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Kdysi se nám je podaâilo vystopovat a sledovat. V lese za mêstem jsme ale museli s pronásledováním pâestat.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Kolem se potuluje spousta šelem, je to moc nebezpeèné.
	
	B_LogEntry(TOPIC_HakonBanditen,"Bandité, kteâí okradli Hakona, se skrývají kdesi v lesích poblíž mêsta." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Ale je tady ještê jedna vêc...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //V Khorinidu se objevila èást uloupeného zboží.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //To znamená, že vêdí, jak lup propašovat do mêsta a pak ho tady prodat...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Jo, máme podezâení, že mají tady nêkde ve mêstê pâekupníka. Zatím se nám ale toho chlápka nepodaâilo chytit.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Pokud by se ti podaâilo na nêco pâijít, tak mêj na pamêti, že lord Andre vypsal na toho pašeráka odmênu.
	
		B_LogEntry(TOPIC_HakonBanditen,"Bandité mají ve mêstê nejspíš nêjakou spojku. Lord Andre nechal na tohoto jejich spojence vypsat odmênu." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "Odkud byli ti bandité, kteâí mêli ten mùj obrázek?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Odkud byli ti bandité, kteâí mêli ten mùj obrázek?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //AHÁ! Takže to nakonec BYL tvùj oblièej. Proè jsi to nepâiznal hned, co?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(naléhavê) Proè po tobê jdou?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Já nevím - vážnê!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Jasnê, jasnê. Chápu. Nêco ti âeknu. Kdybych si myslel, že jsi s têmi bandity jedna ruka, už bys pêknê bruèel v chládku. Kapišto?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //I tak bych to ale asi mêl nahlásit lordu Andremu...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Ale co se týèe té tvé otázky...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Sebrali jsme je poblíž statkáâova sídla.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Rozhodnê ale nevypadají jako Onarovi lidé.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Âekl bych, že to byla èást menší skupinky, která se ukrývá v horách poblíž Onarovy farmy.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Jestli bys ale mêl v plánu se tam vydat, musím tê varovat. Tihle hrdloâezové provedou s každým krátký proces!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Budu to mít na pamêti.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Jak to vypadá?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Vždycky jsem âíkal, že se têm žoldákùm nedá vêâit.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Je naèase, abychom têm neâádùm uštêdâili lekci. Tohle nevymyslel Bennet sám o sobê.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Jsem hluboce otâesen vraždou ctihodného paladina Lothara.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Ale vêâím, že církev viníky spravedlivê potrestá.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Co že se tady potuluješ po okolí? Jestli máš v plánu osvobodit svého žoldáckého pâítelíèka, tak na to rovnou zapomeà.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //To je k pláèi. Teë se nás snaží poštvat proti sobê navzájem.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Jestli nedokážete najít pravého vraha, skâeti nebudou muset ani hnout prstem.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Dêlá mi starosti, co se stane, když teë paladinové odejdou.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Na nás se mùžeš spolehnout. Použijeme všechny dostupné prostâedky, aby tohle mêsto nezabâedlo do bahna bezpráví.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Mêj se na pozoru. Darebáky jako ty nespouštíme jen tak z oèí.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //Teë je docela klid. Problémy nám dêlají jen bandité za hradbami.
	};	

}; 


