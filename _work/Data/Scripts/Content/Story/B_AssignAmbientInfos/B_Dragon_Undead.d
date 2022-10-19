// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //Tak co, mladej? Máš teda originální kopii?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Tak jsi mê koneènê našel. Na tvùj pâíjezd jsem èekal tak dlouho.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Tak pokraèuj. Pâestaà pâedstírat, že sis to takhle pâedstavoval.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(hluèný smích) Co ty mùžeš vêdêt o mých zámêrech?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Neposlal jsem snad Pátraèe, aby tê vlákali mnê do cesty?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Nenechával jsem ti snad stopy o své existenci tak na oèích, žes je nemohl minout?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //A nepâispêla snad draèí vejce k vylepšení tvé zbroje, takže ses sem mohl snadnêji dostat?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Nebyli snad znovuzrození paladinové dostateèným dùvodem, abys zaèal pátrat po skryté moci v pozadí?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Nebylo snad prokletí tvého rodu dostateèným dùvodem, abys zaèal pátrat po skryté síle v pozadí?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Aã se budeš vykrucovat, jak chceš, tohle všechno popâít nemùžeš.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Pouze jedno nikdo nepâedpovêdêl! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Znièil jsi jednoho z mých služebníkù! Byl vyvolen, aby nosil Dráp.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Ale jak vidím, nyní jej nosíš ty. Za tu urážku zemâeš!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dost âeèí.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Jménem koho vedeš své tažení proti lidstvu?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Proè jsi tady?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kdo jsi?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Hlavním nepâítelem je nemrtvý drak. Musím ho zabít, ještê než z tohoto zatraceného ostrova odletí."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(smích) Ještê poâád se na to musíš ptát? Zeptej se sám sebe, ty hlupáku. Víš, kdo jsem.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Nenesu žádné jméno. Stejnê jako ty.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Mùj stvoâitel mi dal božskou moc. Stejnê jako ty v sobê nosíš moc svého boha.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mým osudem je znièení svêta.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Stejnê jako je tvùj osud pâedurèen bezúhonností a poctivostí paladinù.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Stejnê jako tvá ruka pâináší jistou smrt, drakobijèe.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Stejnê jako je tvým údêlem kázat Innosovo uèení, mágu ohnê.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Necítíš to pouto, co nás spolu pojí? Ano, ty víš, kdo jsem.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(rozzlobenê) Ne. To nemùže být pravda. Xardas vždycky âíkal...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas je slabý a ty pro mê nepâedstavuješ žádnou hrozbu. Pro tebe je ctí, že ses se mnou mohl vùbec setkat.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Tak stojí psáno. Nadešel èas pâijmout svùj osud.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Proè jsi tady?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Božství, jež mi bylo propùjèeno, mê podnítilo k tomu, abych tento svêt utopil v âece násilí.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Jedinê tehdy, až poslední pevnost poctivých padne, si budu moci odpoèinout.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Jménem koho vedeš své tažení proti lidstvu?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mým pánem je samotná Tma. Znáš ji. Slyšíš její volání.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Má vojska povstanou v jejím jménu a zahalí svêt do temnoty.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Dost âeèí. Zaženu tê zpêt pod kamení, z pod nêhož ses vyhrabal, ty zrùdo.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(smích) Ještê nejsi schopen mê porazit. Od mého cíle mê už dêlí jen nepatrná chvilka.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Ty vážnê vêâíš, že mê tím Drápem zraníš? (smêje se)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Tvé kosti mi poslouží k tomu, abych mohl nechat vát zhoubný vítr smrti nad povrchem celého svêta.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





