# frozen_string_literal: true

class Reference
  SEGMENTS = { accessory: 'A', clothing: 'V', decoration: 'D' }.freeze
  EXCLUSIVITY = { exclusive: 'U', nonexclusive: 'G' }.freeze

  attr_reader :description, :kind, :season, :year, :exclusivity

  private_constant :EXCLUSIVITY, :SEGMENTS

  def initialize(craft_params)
    @description = craft_params[:description]
    @kind = craft_params[:kind]
    @year = craft_params[:year]
    @season = craft_params[:season]
    @exclusivity = craft_params[:exclusivity]
  end

  def generate
    "#{prefix}#{numeration}"
  end

  private

  def prefix
    @prefix ||= "#{add_kind}-#{add_description}#{year}#{add_season}#{add_exclusivity}"
  end

  def numeration
    crafts = Craft.where("reference LIKE ?", "%" + prefix + "%")

    return '0001' if crafts.empty?

    code = crafts.last.reference

    code[-4..code.length]
      .to_i
      .next
      .to_s
      .rjust(4, '0')
  end

  def add_description
    description[0..2].upcase
  end

  def add_season
    season[0..1].upcase
  end

  def add_kind
    SEGMENTS[kind.downcase.to_sym]
  end

  def add_exclusivity
    exclusivity ? EXCLUSIVITY[:exclusive] : EXCLUSIVITY[:nonexclusive]
  end
end
