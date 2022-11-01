///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hej, nie znam cię... Czego tutaj szukasz? Może knajpy?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Nie, nie idę do knajpy... (KONIEC)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Więc to tutaj zbiera się całe towarzystwo...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Tak, masz coś przeciwko?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Nie, nie szukam knajpy...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Tak, też bym tak powiedział. Ale to nie ma znaczenia - i dlatego możemy od razu przejść do interesów.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Ponieważ jesteś tu nowy, mam dla ciebie propozycję. Zapłacisz mi 50 sztuk złota, a ja pozwolę ci wejść.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Tyle kosztuje wejście do knajpy.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Dowiedzmy się, co na ten temat sądzi straż...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet złamanego grosza!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"W porządku, zapłacę.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale ja nie chcę wejść do knajpy!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Ale ja nie chcę wejść do knajpy!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Taaak, prędzej czy później każdy chce wejść do knajpy. Więc równie dobrze możesz mi zapłacić już teraz - i potem będziesz miał spokój.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Ach, więc to tutaj zbiera się całe towarzystwo. Łatwo pomylić to miejsce z pałacem gubernatora...
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hej, daruj sobie te kiepskie dowcipy, jeśli nie chcesz zbierać zębów z ulicy.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Widzę, że nie obędzie się bez bijatyki...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Za mało masz problemów?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uspokój się, chcę tylko wypić piwo.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale ja nie chcę wejść do knajpy!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Tak, masz coś przeciwko?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Nie masz tu czego szukać, kurduplu.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Widzę, że nie obędzie się bez bijatyki...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Za mało masz problemów?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uspokój się, chcę tylko wypić piwo.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Dowiedzmy się, co na ten temat sądzi straż...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //Na twoim miejscu nie liczyłbym na straż. Strażnicy tu nie przychodzą.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Jesteśmy w dzielnicy portowej, cwaniaczku. Baliby się tutaj z kimkolwiek zadrzeć.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Strażnicy mogą co najwyżej chodzić do 'Czerwonej Latarni'. A zatem, jak sam widzisz, to sprawa tylko między nami.
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Rozumiem. Widzę, że nie obejdzie się bez bijatyki.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Proszę bardzo, spróbuj. Pokaż, co potrafisz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Za mało masz problemów?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Jasne, problemy to moje drugie imię. Broń się, kurduplu!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Uspokój się, chcę tylko wypić piwo.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Dobrze, ale żeby wejść do środka, musisz mi zapłacić 50 sztuk złota.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet złamanego grosza!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"W porządku, zapłacę.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //W porządku, zapłacę.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Wspaniale. A skoro już poszło nam tak łatwo, możesz mi teraz oddać resztę swoich pieniędzy.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet złamanego grosza!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Proszę, to wszystko, co mam.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //...ale nie mam przy sobie tylu pieniędzy.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //To nie ma znaczenia. Po prostu daj mi wszystko, co masz.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet złamanego grosza!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Proszę, to wszystko, co mam.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //...ale nie mam nawet 10 sztuk złota.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Ale trafiłem.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //No dobrze już, dobrze, możesz wejść.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Zapomnij o tym, nie dostaniesz nawet złamanego grosza!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Więc zabiorę wszystko, co masz - ale najpierw spuszczę ci porządne lanie.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Proszę, to wszystko, co mam.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Dobrze, to wystarczy. Chodząca pobłażliwość - oto cały ja.
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "Wiesz, co dzieje się w porcie, prawda?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Wiesz, co dzieje się w porcie, prawda?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Pewnie. A dlaczego pytasz?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Dużo tu macie statków?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Czemu nie widzę tu żadnej straży?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"Słyszałeś ostatnio jakieś plotki?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Dużo tu macie statków?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Jedyny statek w tym mieście należy do paladynów.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Jest zacumowany na południowym zachodzie.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Czemu nie widzę tu żadnej straży?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Straż tutaj nie przychodzi. Sami załatwiamy nasze spory.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //Słyszałeś ostatnio jakieś plotki?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //W tych okolicach nie lubimy, kiedy ktoś zadaje zbyt dużo pytań. Szczególnie jeśli jest to ktoś obcy.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Żadnych. A czego się spodziewałeś? To spokojne miejsce.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //Nie jest dobrze. Czasy są ciężkie, a my z trudem wiążemy koniec z końcem.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Przestań się ze mnie nabijać.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Jak mogłeś pomyśleć coś takiego? Zraniłeś moje uczucia.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Jest niewesoło. Od jakiegoś czasu Lord Andre ciągle wsadza nos w nie swoje sprawy.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Taki elegancik nigdy nie zrozumie, co się tutaj dzieje.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //Nie mamy z tym nic wspólnego.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //To znaczy z czym?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Z tym zamordowanym paladynem. Powinieneś zainteresować się najemnikami, zamiast marnować tutaj swój czas.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //Wiem, że nie miałeś z tym nic wspólnego, ale to morderstwo naprawdę wzbudziło niepokój porządnych obywateli.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Jeśli zechcesz przyjąć przyjacielską radę, najlepiej będzie, jeśli znikniesz z miasta. Przynajmniej na jakiś czas.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Odkąd zostało udowodnione, że najemnicy nie mieli nic wspólnego ze śmiercią tego paladyna, straż boi się tu przychodzić.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Pewnie obawiają się tych paru mieszkających tutaj pijaków, he, he. I dobrze.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Nic się tu nie dzieje.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Ci nadęci paladyni opuszczają nasz port. Najwyższy czas.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Hej, ty! Pozdrowienia od Lehmara.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







