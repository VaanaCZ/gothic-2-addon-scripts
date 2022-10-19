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
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Tak jsi mì koneènì našel. Na tvùj pøíjezd jsem èekal tak dlouho.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Tak pokraèuj. Pøestaò pøedstírat, e sis to takhle pøedstavoval.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(hluènı smích) Co ty mùeš vìdìt o mıch zámìrech?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Neposlal jsem snad Pátraèe, aby tì vlákali mnì do cesty?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Nenechával jsem ti snad stopy o své existenci tak na oèích, es je nemohl minout?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //A nepøispìla snad draèí vejce k vylepšení tvé zbroje, take ses sem mohl snadnìji dostat?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Nebyli snad znovuzrození paladinové dostateènım dùvodem, abys zaèal pátrat po skryté moci v pozadí?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Nebylo snad prokletí tvého rodu dostateènım dùvodem, abys zaèal pátrat po skryté síle v pozadí?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //A se budeš vykrucovat, jak chceš, tohle všechno popøít nemùeš.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Pouze jedno nikdo nepøedpovìdìl! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Znièil jsi jednoho z mıch sluebníkù! Byl vyvolen, aby nosil Dráp.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Ale jak vidím, nyní jej nosíš ty. Za tu uráku zemøeš!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dost øeèí.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Jménem koho vedeš své taení proti lidstvu?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Proè jsi tady?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kdo jsi?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Hlavním nepøítelem je nemrtvı drak. Musím ho zabít, ještì ne z tohoto zatraceného ostrova odletí."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(smích) Ještì poøád se na to musíš ptát? Zeptej se sám sebe, ty hlupáku. Víš, kdo jsem.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Nenesu ádné jméno. Stejnì jako ty.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Mùj stvoøitel mi dal boskou moc. Stejnì jako ty v sobì nosíš moc svého boha.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mım osudem je znièení svìta.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Stejnì jako je tvùj osud pøedurèen bezúhonností a poctivostí paladinù.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Stejnì jako tvá ruka pøináší jistou smrt, drakobijèe.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Stejnì jako je tvım údìlem kázat Innosovo uèení, mágu ohnì.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Necítíš to pouto, co nás spolu pojí? Ano, ty víš, kdo jsem.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(rozzlobenì) Ne. To nemùe bıt pravda. Xardas vdycky øíkal...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas je slabı a ty pro mì nepøedstavuješ ádnou hrozbu. Pro tebe je ctí, e ses se mnou mohl vùbec setkat.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Tak stojí psáno. Nadešel èas pøijmout svùj osud.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Proè jsi tady?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Boství, je mi bylo propùjèeno, mì podnítilo k tomu, abych tento svìt utopil v øece násilí.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Jedinì tehdy, a poslední pevnost poctivıch padne, si budu moci odpoèinout.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Jménem koho vedeš své taení proti lidstvu?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mım pánem je samotná Tma. Znáš ji. Slyšíš její volání.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Má vojska povstanou v jejím jménu a zahalí svìt do temnoty.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Dost øeèí. Zaenu tì zpìt pod kamení, z pod nìho ses vyhrabal, ty zrùdo.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(smích) Ještì nejsi schopen mì porazit. Od mého cíle mì u dìlí jen nepatrná chvilka.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Ty vánì vìøíš, e mì tím Drápem zraníš? (smìje se)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Tvé kosti mi poslouí k tomu, abych mohl nechat vát zhoubnı vítr smrti nad povrchem celého svìta.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





