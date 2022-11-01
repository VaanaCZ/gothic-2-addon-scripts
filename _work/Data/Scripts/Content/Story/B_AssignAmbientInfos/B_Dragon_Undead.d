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
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Tak jsi mę konečnę našel. Na tvůj pâíjezd jsem čekal tak dlouho.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Tak pokračuj. Pâestaŕ pâedstírat, že sis to takhle pâedstavoval.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(hlučný smích) Co ty můžeš vędęt o mých zámęrech?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Neposlal jsem snad Pátrače, aby tę vlákali mnę do cesty?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Nenechával jsem ti snad stopy o své existenci tak na očích, žes je nemohl minout?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //A nepâispęla snad dračí vejce k vylepšení tvé zbroje, takže ses sem mohl snadnęji dostat?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Nebyli snad znovuzrození paladinové dostatečným důvodem, abys začal pátrat po skryté moci v pozadí?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Nebylo snad prokletí tvého rodu dostatečným důvodem, abys začal pátrat po skryté síle v pozadí?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Aă se budeš vykrucovat, jak chceš, tohle všechno popâít nemůžeš.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Pouze jedno nikdo nepâedpovędęl! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Zničil jsi jednoho z mých služebníků! Byl vyvolen, aby nosil Dráp.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Ale jak vidím, nyní jej nosíš ty. Za tu urážku zemâeš!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dost âečí.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Jménem koho vedeš své tažení proti lidstvu?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Proč jsi tady?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kdo jsi?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Hlavním nepâítelem je nemrtvý drak. Musím ho zabít, ještę než z tohoto zatraceného ostrova odletí."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(smích) Ještę poâád se na to musíš ptát? Zeptej se sám sebe, ty hlupáku. Víš, kdo jsem.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Nenesu žádné jméno. Stejnę jako ty.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Můj stvoâitel mi dal božskou moc. Stejnę jako ty v sobę nosíš moc svého boha.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mým osudem je zničení svęta.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Stejnę jako je tvůj osud pâedurčen bezúhonností a poctivostí paladinů.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Stejnę jako tvá ruka pâináší jistou smrt, drakobijče.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Stejnę jako je tvým údęlem kázat Innosovo učení, mágu ohnę.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Necítíš to pouto, co nás spolu pojí? Ano, ty víš, kdo jsem.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(rozzlobenę) Ne. To nemůže být pravda. Xardas vždycky âíkal...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas je slabý a ty pro mę nepâedstavuješ žádnou hrozbu. Pro tebe je ctí, že ses se mnou mohl vůbec setkat.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Tak stojí psáno. Nadešel čas pâijmout svůj osud.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Proč jsi tady?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Božství, jež mi bylo propůjčeno, mę podnítilo k tomu, abych tento svęt utopil v âece násilí.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Jedinę tehdy, až poslední pevnost poctivých padne, si budu moci odpočinout.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Jménem koho vedeš své tažení proti lidstvu?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mým pánem je samotná Tma. Znáš ji. Slyšíš její volání.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Má vojska povstanou v jejím jménu a zahalí svęt do temnoty.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Dost âečí. Zaženu tę zpęt pod kamení, z pod nęhož ses vyhrabal, ty zrůdo.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(smích) Ještę nejsi schopen mę porazit. Od mého cíle mę už dęlí jen nepatrná chvilka.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Ty vážnę vęâíš, že mę tím Drápem zraníš? (smęje se)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Tvé kosti mi poslouží k tomu, abych mohl nechat vát zhoubný vítr smrti nad povrchem celého svęta.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





