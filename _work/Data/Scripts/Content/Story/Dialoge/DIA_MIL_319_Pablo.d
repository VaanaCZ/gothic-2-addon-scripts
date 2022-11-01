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
	description = "(Tento klíč by ukradlo i malé dítě.)";
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
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hej, počkej - jsi mi nějaký povědomý.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Co chceš?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Tvůj obličej jsem už někde viděl... ano - už vím!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Tady - tenhle obrázek u sebe měla skupina banditů, kterou jsme sbalili před pár dny. Vypadá vážně jako ty.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Zdá se, že tě ti chlapíci hledali.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Ne, musel ses splést.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Božínku, něco takového by mě samotného nikdy nenapadlo.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Ne, to se určitě pletete. To musel být někdo jiný.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Jak myslíš, cizinče.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Ale jestli se nakonec ukáže, žes na tom obrázku přece jenom byl TY - a pokud budeš mít nějaké potíže - snaž se je netahat s sebou do města. Už takhle to tady není žádný med.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //A cizinci, kteří s sebou přinášejí potíže, tady moc dlouho většinou nezůstanou - doufám, že jsem se vyjádřil jasně.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Božínku, něco takového by mě samotného nikdy nenapadlo.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Vážně legrace... co od tebe ti chlapíci chtěli?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Zeptejte se jich sami. Máte je přece v bezpečí pod zámkem, ne?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Ne - jsou mrtví.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //Tak mám dojem, že se to už nikdy nedozvíme.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //V případě, že bys měl nějaké problémy, promluv si s lordem Andrem. Možná by byl schopný ti pomoci. Najdeš ho v kasárnách.
	
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
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Všichni pocházejí z té zatracené těžařské kolonie. Je mezi nimi ale několik skupinek odpadlíků.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Někteří se zašili v horách a další se spojili s Onarem, velkostatkářem.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Nejvíc potíží ale způsobují bandité, kteří se zdržují mimo město.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //To kvůli nim se teď žádný obchodník neodváží vyrazit za městské brány.
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
	description = "Nevíš něco o banditech, kteří okradli obchodníka Hakona?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Nevíš něco o banditech, kteří okradli obchodníka Hakona?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Jo TOHLE. Ani mi to nepřipomínej.
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Co víme, tak mají na svědomí už pěknou řádku útoků na různé kupce.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ty krysy zalezly do svých děr a neodvažují se ani vystrčit nos.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Kdysi se nám je podařilo vystopovat a sledovat. V lese za městem jsme ale museli s pronásledováním přestat.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Kolem se potuluje spousta šelem, je to moc nebezpečné.
	
	B_LogEntry(TOPIC_HakonBanditen,"Bandité, kteří okradli Hakona, se skrývají kdesi v lesích poblíž města." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Ale je tady ještě jedna věc...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //V Khorinidu se objevila část uloupeného zboží.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //To znamená, že vědí, jak lup propašovat do města a pak ho tady prodat...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Jo, máme podezření, že mají tady někde ve městě překupníka. Zatím se nám ale toho chlápka nepodařilo chytit.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Pokud by se ti podařilo na něco přijít, tak měj na paměti, že lord Andre vypsal na toho pašeráka odměnu.
	
		B_LogEntry(TOPIC_HakonBanditen,"Bandité mají ve městě nejspíš nějakou spojku. Lord Andre nechal na tohoto jejich spojence vypsat odměnu." );
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
	description = "Odkud byli ti bandité, kteří měli ten můj obrázek?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Odkud byli ti bandité, kteří měli ten můj obrázek?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //AHÁ! Takže to nakonec BYL tvůj obličej. Proč jsi to nepřiznal hned, co?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(naléhavě) Proč po tobě jdou?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Já nevím - vážně!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Jasně, jasně. Chápu. Něco ti řeknu. Kdybych si myslel, že jsi s těmi bandity jedna ruka, už bys pěkně bručel v chládku. Kapišto?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //I tak bych to ale asi měl nahlásit lordu Andremu...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Ale co se týče té tvé otázky...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Sebrali jsme je poblíž statkářova sídla.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Rozhodně ale nevypadají jako Onarovi lidé.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Řekl bych, že to byla část menší skupinky, která se ukrývá v horách poblíž Onarovy farmy.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Jestli bys ale měl v plánu se tam vydat, musím tě varovat. Tihle hrdlořezové provedou s každým krátký proces!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Budu to mít na paměti.
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
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Vždycky jsem říkal, že se těm žoldákům nedá věřit.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Je načase, abychom těm neřádům uštědřili lekci. Tohle nevymyslel Bennet sám o sobě.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Jsem hluboce otřesen vraždou ctihodného paladina Lothara.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Ale věřím, že církev viníky spravedlivě potrestá.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Co že se tady potuluješ po okolí? Jestli máš v plánu osvobodit svého žoldáckého přítelíčka, tak na to rovnou zapomeň.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //To je k pláči. Teď se nás snaží poštvat proti sobě navzájem.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Jestli nedokážete najít pravého vraha, skřeti nebudou muset ani hnout prstem.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Dělá mi starosti, co se stane, když teď paladinové odejdou.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Na nás se můžeš spolehnout. Použijeme všechny dostupné prostředky, aby tohle město nezabředlo do bahna bezpráví.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Měj se na pozoru. Darebáky jako ty nespouštíme jen tak z očí.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //Teď je docela klid. Problémy nám dělají jen bandité za hradbami.
	};	

}; 


